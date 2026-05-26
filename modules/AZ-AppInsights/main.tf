resource "azurerm_application_insights" "APPINSIGHTS" {
  count                   = var.deploy ? 1 : 0
  name                = var.appinsightsname
  location            = var.location
  resource_group_name = var.resourcegroupname
  application_type    = "web"
}
