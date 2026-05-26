terraform {
  backend "azurerm" {
    resource_group_name = "tfstate-rg"
    storage_account_name = "tfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
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
  name     = locals.resourcegroupname
  location = var.location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = locals.baseResourceName + "-vnet"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  address_space       = var.ip
}