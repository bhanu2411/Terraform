resource "azurerm_storage_account" "sa" {
  name                     = var.storageaccountname
  resource_group_name      = var.resourcegroupname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
  }
}