module "AZ-ApplicationInsights" {
  source = "../../modules/AZ-ApplicationInsights"
  appinsightsname = "${local.baseResourceName}-appinsights"
  location = var.location
  resourcegroupname = azurerm_resource_group.resource_group.name
  deploy = var.app_insights_deploy
}