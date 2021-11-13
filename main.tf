# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.71.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

# Create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = "dips-myrg"
  location = "UK South"
}

# Create a virtual network in the learn-resources resource group
resource "azurerm_virtual_network" "myvnet" {
  name                = "dips-myvnet"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = ["10.0.0.0/16"]
}

# Create a subnet within the vnet 
resource "azurerm_subnet" "mysubnet" {
  name                = "dips-mysubnet"
  resource_group_name = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_space       = ["10.0.1.0/24"]
}