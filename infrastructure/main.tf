terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
    tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  features {}
}

provider "azuread" {
}

locals {
  baseResourceName = "${var.environment}-${var.location}"

  resourcegroupname = "${local.baseResourceName}-rg"
}

# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = locals.baseResourceGroupName
  location = var.location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "var.vnetname"
  resource_group_name = "var.resourcegroupname"
  location            = "var.location"
  address_space       = ["10.0.0.0/16"]
}