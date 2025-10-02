
variable "vpc_cidr" {
  description = "The CIDR block for the AWS VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_subnet_cidr" {
  description = "The CIDR block for the AWS public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "azure_vnet_cidr" {
  description = "The CIDR block for the Azure Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "azure_subnet_cidr" {
  description = "The CIDR block for the Azure default subnet."
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

variable "gcp_vpc_name" {
  description = "The name for the GCP custom mode VPC."
  type        = string
  default     = "gcp-base-vpc"
}

# Variables inherited from root level
variable "common_tags" {
  description = "Tags map inherited from the environment configuration."
  type        = map(string)
}
