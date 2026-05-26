output "name" {
  value = azurerm_key_vault.kv[0].name
}
output "location" {
  value = azurerm_key_vault.kv[0].location
}
output "resource_group_name" {
  value = azurerm_key_vault.kv[0].resource_group_name
}
