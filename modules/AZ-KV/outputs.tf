output "name" {
  value = azurerm_key_vault.kv.name
}
output "location" {
  value = azurerm_key_vault.kv.location
}
output "resource_group_name" {
  value = azurerm_key_vault.kv.resource_group_name
}
variable "deploy" {
  type = bool
}