# envs/prod/main.tf

# Configuration for the 'prod' environment.
# Focus on high availability, performance, and robust configuration.

locals {
  tags = merge(var.common_tags, {
    Environment = "prod"
  })
}

# --- AWS Production VM ---
module "aws_prod_vm" {
  source = "../../modules/aws_vm"

  prefix            = "prd-app"
  ami_id            = "ami-0abcdef1234567890" # Placeholder for a production-ready AMI
  instance_type     = "m5.large"              # Production-grade instance
  subnet_id         = "subnet-prod-c"
  security_group_id = "sg-prod-web"
  key_name          = "prod-key"
  common_tags       = local.tags
}

# --- Azure Production Storage ---
module "azure_prod_storage" {
  source = "../../modules/azure_storage"

  prefix           = "prdmulticloud"
  location         = "westeurope"
  account_tier     = "Standard"
  replication_type = "GRS" # Geo-Redundant Storage (disaster recovery)
  common_tags      = local.tags
}

# --- GCP Production VM ---
module "gcp_prod_vm" {
  source = "../../modules/gcp_vm"

  prefix           = "prd-api"
  machine_type     = "n2-standard-2"
  zone             = "europe-west1-c"
  environment_name = "prod"
  common_tags      = local.tags
}
# End of prod/main.tf
