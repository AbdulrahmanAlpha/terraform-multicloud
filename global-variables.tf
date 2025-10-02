# Defines variables that are shared and consistent across all environments (dev, staging, prod).

variable "business_unit" {
  description = "The corporate business unit responsible for the infrastructure."
  type        = string
  default     = "IT-Ops"
}

variable "project_name" {
  description = "The common name for this multi-cloud project."
  type        = string
  default     = "Multicloud-App"
}

variable "common_tags" {
  description = "A map of tags to apply to all resources for billing and tracking."
  type        = map(string)
  default = {
    "Owner"       = "Terraform Team"
    "Environment" = "See environment-specific configs" # Overridden per env
    "Project"     = "Multicloud-App"
    "CostCenter"  = "9999"
  }
}