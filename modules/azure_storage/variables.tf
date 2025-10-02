# modules/azure_storage/variables.tf

# Input variables for the Azure Storage module.
variable "prefix" {
  description = "A unique prefix for the Azure Resource Group and Storage Account."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
}

variable "account_tier" {
  description = "The storage account tier (e.g., 'Standard', 'Premium')."
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "The storage replication type (e.g., 'LRS', 'GRS')."
  type        = string
  default     = "LRS"
}

variable "common_tags" {
  description = "Tags map inherited from the environment configuration."
  type        = map(string)
}
# End of variables.tf
