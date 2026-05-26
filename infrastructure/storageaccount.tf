module "sa" {
  source = "../modules/AZ-StorageAccount"

  deploy = var.storageaccountdeploy
  storageaccountname = "${local.baseResourceName}-sa"
  resourcegroupname = azurerm_resource_group.resource_group.name
  location = var.location
  environment = var.environment
}