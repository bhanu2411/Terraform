environment = "prod"
location = "eastus"

modules = {
  AZ-AppService = {
    source = "../../modules/AZ-AppService"
    appserviceplanname = "${local.baseResourceName}-asp"
    appservicename = "${local.baseResourceName}-appservice"
    location = var.location
    resourcegroupname = azurerm_resource_group.resource_group.name
  }
}

module "AZ-KV" {
  source = "../../modules/AZ-KV"
  keyvaultname = "${local.baseResourceName}-kv"
  location = var.location
  resourcegroupname = azurerm_resource_group.resource_group.name
}

module "AZ-StorageAccount" {
  source = "../../modules/AZ-StorageAccount"
  storageaccountname = "${local.baseResourceName}stg"
  location = var.location
  resourcegroupname = azurerm_resource_group.resource_group.name
}

module "AZ-ApplicationInsights" {
  source = "../../modules/AZ-ApplicationInsights"
  appinsightsname = "${local.baseResourceName}-appinsights"
  location = var.location
  resourcegroupname = azurerm_resource_group.resource_group.name
}