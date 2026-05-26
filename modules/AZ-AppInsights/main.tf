resource "azurerm_application_insights" "APPINSIGHTS" {
  name                = "var.appinsightsname"
  location            = "var.location"
  resource_group_name = "var.resourcegroupname"
  application_type    = "web"
}
