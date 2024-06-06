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
        
resource "azurerm_resource_group" "rg" {  
    name     = "myTFResourceGroup"  
    location = "westus2"
    tags = {
    team     = "dopt",
    owner    = "dopt",
    activity = "test-TFE",
  }
}

# module "storage-account" {
#   source  = "app.terraform.io/DXE-POC/storage-account/azurerm"
#   version = "0.3.0"
#   resource_group_name = "rg-tfe-poc"
# }