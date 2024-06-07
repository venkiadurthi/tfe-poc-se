# terraform {  
#     required_providers {    
#         azurerm = {      
#             source  = "hashicorp/azurerm"      
#             version = "~> 3.0.2"    
#             }  
#         }  
#     required_version = ">= 1.1.0"
# }

provider "azurerm" {
  features {
  }
}

# resource "azurerm_resource_group" "rg" {  
#     name     = "myTFResourceGroup"  
#     location = "westus2"
#     tags = {
#     team     = "dopt",
#     owner    = "dopt",
#     activity = "test-TFE",
#   }
# }

# module "storage-account" {
#   source  = "app.terraform.io/DXE-POC/storage-account/azurerm"
#   version = "0.3.0"
#   resource_group_name = "rg-tfe-poc"
# }
module "vm-module" {
  source       = "app.terraform.io/DXE-POC/vm-module/azurerm"
  version      = "0.0.1"
  rg_name      = data.azurerm_resource_group.rg.name
  rg_loc       = data.azurerm_resource_group.rg.rg.location
  storage_name = "tfeteststorage"
  vm_name      = "tfe-poc-network"
}

data "azurerm_resource_group" "rg" {
  name = "rg-tfe-poc"
}

# resource "azurerm_storage_account" "example" {
#   name                     = "tfeteststorage"
#   resource_group_name      = data.azurerm_resource_group.rg.name
#   location                 = data.azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   tags = {
#     environment = "staging",
#     team        = "dopt",
#     owner       = "dopt",
#     activity    = "test-TFE",
#   }
# }


# resource "azurerm_virtual_network" "example" {
#   name                = "tfe-poc-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
# }

# resource "azurerm_subnet" "example" {
#   name                 = "internal"
#   resource_group_name  = data.azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# resource "azurerm_network_interface" "example" {
#   name                = "tfe-poc-nic"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.example.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "example" {
#   name                = "tfe-poc-machine"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   location            = data.azurerm_resource_group.rg.location
#   size                = "Standard_F2"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.example.id,
#   ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("id_rsa.pub")
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }