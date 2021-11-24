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

module "vm" {
  source             = "./VM/"
  application        = var.application
  rgname             = "rg-${var.application}"
  location           = var.location
  vmname             = "VM-${var.application}"
  vm_size            = var.vm_size
  admin_username     = var.admin_username
  admin_password     = var.admin_password
  os                 = var.os
  vnet_address_space = var.vnet_address_space
  snet_address_space = var.snet_address_space

  depends_on = [
    module.resource-group1
  ]
}
