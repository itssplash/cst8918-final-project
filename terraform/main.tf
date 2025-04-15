provider "azurerm" {
  features {}
  skip_provider_registration = true
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}




module "backend_storage" {
  source               = "./modules/backend-storage"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  subnets             = var.subnets
}



# module "k8s_app_test" {
#   source              = "./modules/k8s-app-deployment"
#   environment         = "test"
#   resource_group_name = var.resource_group_name
#   aks_name            = module.aks_test.aks_name
#   image_tag           = var.image_tag
#   acr_login_server    = module.acr.login_server
# }

# module "k8s_app_prod" {
#   source              = "./modules/k8s-app-deployment"
#   environment         = "prod"
#   resource_group_name = var.resource_group_name
#   aks_name            = module.aks_prod.aks_name
#   image_tag           = var.image_tag
#   acr_login_server    = module.acr.login_server
# }

