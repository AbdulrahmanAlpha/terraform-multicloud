# modules/aws_vm/variables.tf

# Input variables for the AWS VM module.
variable "prefix" {
  description = "A unique prefix for the VM name (e.g., 'dev-app')."
  type        = string
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start (e.g., t2.micro)."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to place the instance in."
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to attach to the instance."
  type        = string
}

variable "key_name" {
  description = "The SSH key pair name."
  type        = string
}

variable "common_tags" {
  description = "Tags map inherited from the environment configuration."
  type        = map(string)
}
