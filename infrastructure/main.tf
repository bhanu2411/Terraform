terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

  provider "azurerm" {
      # No client_secret here — set these env vars in CI instead:
  # ARM_CLIENT_SECRET, ARM_CLIENT_ID, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID
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
  name                = "${local.baseResourceName}-vnet"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  address_space       = var.ip
}