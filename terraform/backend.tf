terraform {
  required_version = ">= 1.3.0"

  backend "azurerm" {
    resource_group_name  = "cst8918-final-project"
    storage_account_name = "cst8918storagegroupfp10"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
  
}