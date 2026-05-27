output "appservicename" {
  description = "Name of the App Service"
  value       = azurerm_windows_web_app.WA[0].name
}
output "appserviceplanname" {
  description = "Name of the App Service Plan"
  value       = azurerm_service_plan.ASP[0].name
}