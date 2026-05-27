output "storage_account_name" {
  value = azurerm_storage_account.sa[0].name
}

output "storage_account_key" {
  value = azurerm_storage_account.sa[0].primary_access_key
  sensitive = true
}