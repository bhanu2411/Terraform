output "appservicename" {
  description = "Name of the App Service"
  value       = azurerm_windows_web_app.WA.name
}
output "appserviceplanname" {
  description = "Name of the App Service Plan"
  value       = azurerm_app_service_plan.ASP.name
}