resource "azurerm_key_vault" "kv" {
  count                   = var.deploy ? 1 : 0
  name                        = var.keyvaultname
  location                    = var.location
  resource_group_name         = var.resourcegroupname
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
  public_network_access_enabled = false
  network_acls {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
  sku_name = "standard"
  rbac_authorization_enabled = true

}