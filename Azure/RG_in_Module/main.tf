terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}

#Azure provider
provider "azurerm" {
  features {}
}

module "resource-group1" {
  source   = "./RG/"
  rgname   = "rg-${var.application}"
  location = var.location
}
