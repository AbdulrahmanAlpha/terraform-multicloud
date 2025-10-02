# modules/azure_storage/main.tf

# Creates an Azure Storage Account.
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = "${lower(var.prefix)}sa${random_id.suffix.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  tags = var.common_tags
}

resource "random_id" "suffix" {
  byte_length = 4
}
