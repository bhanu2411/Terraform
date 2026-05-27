output "instrumentation_key" {
  value = azurerm_application_insights.APPINSIGHTS[0].instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.APPINSIGHTS[0].app_id
}

output "application_insights_instrumentation_key" {
  value = azurerm_application_insights.APPINSIGHTS[0].instrumentation_key
}