resource "azurerm_storage_account" "sa" {
  count                   = var.deploy ? 1 : 0
  name                     = var.storageaccountname
  resource_group_name      = var.resourcegroupname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  https_traffic_only_enabled = true
  tags = {
    environment = var.environment
  }
}