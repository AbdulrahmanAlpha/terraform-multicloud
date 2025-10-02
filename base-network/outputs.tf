# Exports the IDs needed by the environment configurations.

# AWS Outputs
output "aws_vpc_id" {
  description = "The ID of the main AWS VPC."
  value       = aws_vpc.main.id
}

output "aws_subnet_id" {
  description = "The ID of the main AWS public subnet."
  value       = aws_subnet.public.id
}

output "aws_security_group_id" {
  description = "The ID of the main AWS web security group."
  value       = aws_security_group.web_sg.id
}

# Azure Outputs
output "azure_resource_group_name" {
  description = "The name of the Azure resource group for networking."
  value       = azurerm_resource_group.network_rg.name
}

output "azure_subnet_id" {
  description = "The ID of the main Azure subnet."
  value       = azurerm_subnet.main.id
}

# GCP Outputs
output "gcp_vpc_name" {
  description = "The name of the GCP VPC."
  value       = google_compute_network.main.name
}

output "gcp_subnet_name" {
  description = "The name of the GCP public subnetwork."
  value       = google_compute_subnetwork.main.name
}
