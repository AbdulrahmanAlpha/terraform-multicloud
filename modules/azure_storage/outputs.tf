# modules/azure_storage/outputs.tf

# Outputs the primary attributes of the created Azure Storage Account.
output "storage_account_name" {
  description = "The unique name of the Azure Storage Account."
  value       = azurerm_storage_account.storage.name
}

output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.rg.name
}
# End of outputs.tf
