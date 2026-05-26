resource "azurerm_app_service_plan" "ASP" {
  name                = "var.appserviceplanname"
  location            = "var.location"
  resource_group_name = "var.resourcegroupname"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_windows_web_app" "WA" {
  name                = "var.appservicename"
  location            = "var.location"
  resource_group_name = "var.resourcegroupname"
  service_plan_id     = azurerm_app_service_plan.ASP.id
  https_only          = true

  site_config {
    application_stack {
      current_stack = "node"
      node_version = "~22"
    }
  }
  identity {
    type = "SystemAssigned"
  }
}