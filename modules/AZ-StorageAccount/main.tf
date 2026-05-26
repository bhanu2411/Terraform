resource "azurerm_storage_account" "sa" {
  count                   = var.deploy ? 1 : 0
  name                     = var.storageaccountname
  resource_group_name      = var.resourcegroupname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  https_traffic_only_enabled = true
  allow_nested_items_to_be_public = false
  min_tls_version = "TLS1_2"
  tags = {
    environment = var.environment
  }
}