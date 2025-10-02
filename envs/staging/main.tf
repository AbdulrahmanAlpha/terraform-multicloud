# envs/staging/main.tf

# Configuration for the 'staging' environment.
# Resources are usually scaled up to resemble the production environment.

locals {
  tags = merge(var.common_tags, {
    Environment = "staging"
  })
}

# --- AWS Staging VM ---
module "aws_staging_vm" {
  source = "../../modules/aws_vm"

  prefix            = "stg-app"
  ami_id            = "ami-0abcdef1234567890" # Placeholder for a stable AMI
  instance_type     = "t3.medium"             # More realistic sizing
  subnet_id         = "subnet-stg-b"
  security_group_id = "sg-stg-web"
  key_name          = "stg-key"
  common_tags       = local.tags
}

# --- Azure Staging Storage ---
module "azure_staging_storage" {
  source = "../../modules/azure_storage"

  prefix           = "stgmulticloud"
  location         = "westus2"
  account_tier     = "Standard"
  replication_type = "ZRS" # Zone-Redundant Storage (better resilience)
  common_tags      = local.tags
}

# --- GCP Staging VM ---
module "gcp_staging_vm" {
  source = "../../modules/gcp_vm"

  prefix           = "stg-api"
  machine_type     = "e2-medium"
  zone             = "us-central1-b"
  environment_name = "staging"
  common_tags      = local.tags
}
# End of staging/main.tf