module "appservice" {
  source = "../../modules/AZ-AppService"
  deploy = var.appservice_deploy
  appservicename = "${local.baseResourceName}-appservice"
  appserviceplanname = "${local.baseResourceName}-appserviceplan"
  location = var.location
  resourcegroupname = azurerm_resource_group.resource_group.name
  
}