# This file defines the core, non-environment-specific network infrastructure.

# --- 1. AWS VPC Setup ---

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = merge(var.common_tags, {
    Name = "multicloud-base-vpc"
  })
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.aws_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a" # Hardcoded AZ for simplicity
  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web-access-sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow inbound HTTP/SSH traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# --- 2. Azure VNet Setup ---

resource "azurerm_resource_group" "network_rg" {
  name     = "multicloud-network-rg"
  location = "eastus"
  tags     = var.common_tags
}

resource "azurerm_virtual_network" "main" {
  name                = "multicloud-vnet"
  address_space       = var.azure_vnet_cidr
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
}

resource "azurerm_subnet" "main" {
  name                 = "default-subnet"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.azure_subnet_cidr
}


# --- 3. GCP VPC Setup ---

resource "google_compute_network" "main" {
  name                    = var.gcp_vpc_name
  auto_create_subnetworks = false # Use custom subnets
}

resource "google_compute_subnetwork" "main" {
  name          = "public-subnetwork"
  ip_cidr_range = "10.2.1.0/24" # Different CIDR for GCP
  region        = "us-central1"
  network       = google_compute_network.main.id
}

resource "google_compute_firewall" "ssh_http" {
  name    = "allow-ssh-http"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-web-ssh"] # VMs must have this tag to get the rule
}
