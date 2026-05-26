resource "azurerm_service_plan" "ASP" {
  count = var.deploy ? 1 : 0
  name                = var.appserviceplanname
  location            = var.location
  resource_group_name = var.resourcegroupname
  os_type = "Windows"
  sku_name = "Standard_S1"
}

resource "azurerm_windows_web_app" "WA" {
  count = var.deploy ? 1 : 0
  name                = var.appservicename
  location            = var.location
  resource_group_name = var.resourcegroupname
  service_plan_id     = azurerm_service_plan.ASP[0].id
  https_only          = true

  site_config {
    minimum_tls_version = "1.2"
    ftps_state          = "Disabled"  
    application_stack {
      current_stack = "node"
      node_version  = "~22"
    }
  }
  identity {
    type = "SystemAssigned"
  }
}