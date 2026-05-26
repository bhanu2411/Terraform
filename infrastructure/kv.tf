module "AZ-KV" {
  source = "../../modules/AZ-KV"
  deploy = kv_deploy
  keyvaultname = "${local.baseResourceName}-kv"
  location = var.location
  resourcegroupname = azurerm_resource_group.resource_group.name
}