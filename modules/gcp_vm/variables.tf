# modules/gcp_vm/variables.tf

# Input variables for the GCP VM module.
variable "prefix" {
  description = "A unique prefix for the VM name (e.g., 'dev-gcp')."
  type        = string
}

variable "machine_type" {
  description = "The machine type (e.g., 'e2-micro')."
  type        = string
}

variable "zone" {
  description = "The zone to create the instance in."
  type        = string
}

variable "source_image" {
  description = "The source image for the boot disk."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "environment_name" {
  description = "The name of the environment (e.g., dev, prod)."
  type        = string
}

variable "common_tags" {
  description = "Labels map inherited from the environment configuration."
  type        = map(string)
}
