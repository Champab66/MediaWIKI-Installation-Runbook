terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=2.91.0"
        }
    }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "demo-rg" {
  name     = "demo-resources"
  location = "East US"
}

resource "azurerm_virtual_network" "demo-vn" {
  name                = "demo-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo-rg.location
  resource_group_name = azurerm_resource_group.demo-rg.name
}

resource "azurerm_subnet" "demo-sn" {
  name                 = "demo-subnet"
  resource_group_name  = azurerm_resource_group.demo-rg.name
  virtual_network_name = azurerm_virtual_network.demo-vn.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "demo-nic" {
  name                = "demo-nic"
  location            = azurerm_resource_group.demo-rg.location
  resource_group_name = azurerm_resource_group.demo-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.demo-sn.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "demo-ip" {
  name = "demo-ip"
  location = azurerm_resource_group.demo-rg.location
  resource_group_name = azurerm_resource_group.demo-rg.name
  allocation_method = "Dynamic"
}

resource "azurerm_linux_virtual_machine" "demo-vm" {
  name                  = "demo-machine"
  resource_group_name   = azurerm_resource_group.demo-rg.name
  location              = azurerm_resource_group.demo-rg.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.demo-nic.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
