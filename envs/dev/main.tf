# envs/dev/main.tf

# Configuration for the 'dev' environment.
# This environment typically uses smaller, less expensive resources.

locals {
  # Merge global tags with environment-specific tags
  tags = merge(var.common_tags, {
    Environment = "dev"
  })
}

# --- AWS Development VM ---
module "aws_dev_vm" {
  source = "../../modules/aws_vm"

  prefix            = "dev-app"
  ami_id            = "ami-0abcdef1234567890" # Placeholder for a dev AMI
  instance_type     = "t2.micro"              # Small, cheap instance
  subnet_id         = "subnet-dev-a"          # Placeholder
  security_group_id = "sg-dev-web"            # Placeholder
  key_name          = "dev-key"
  common_tags       = local.tags
}

# --- Azure Development Storage ---
module "azure_dev_storage" {
  source = "../../modules/azure_storage"

  prefix           = "devmulticloud"
  location         = "eastus"
  account_tier     = "Standard"
  replication_type = "LRS" # Locally Redundant Storage (cheapest)
  common_tags      = local.tags
}

# --- GCP Development VM ---
module "gcp_dev_vm" {
  source = "../../modules/gcp_vm"

  prefix           = "dev-api"
  machine_type     = "e2-micro"
  zone             = "us-central1-a"
  environment_name = "dev"
  common_tags      = local.tags
}
