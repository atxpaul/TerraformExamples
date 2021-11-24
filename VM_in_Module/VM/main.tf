resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.application}-${var.location}"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.rgname
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-${var.application}-${var.location}"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.snet_address_space
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.application}"
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "niccfg-${var.vmname}"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vmname
  location                        = var.location
  resource_group_name             = var.rgname
  network_interface_ids           = [azurerm_network_interface.nic.id]
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = lookup(var.storage_account_type, var.location, "Standard_LRS")
  }

  source_image_reference {
    publisher = var.os.publisher
    offer     = var.os.offer
    sku       = var.os.sku
    version   = var.os.version
  }

}
