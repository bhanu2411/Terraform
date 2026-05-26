module "sa" {
  source = "../../modules/AZ-StorageAccount"

  deploy = var.storage_account_deploy
  storageaccountname = "${local.baseResourceName}-sa"
  resourcegroupname = azurerm_resource_group.resource_group.name
  location = var.location
  environment = var.environment
}