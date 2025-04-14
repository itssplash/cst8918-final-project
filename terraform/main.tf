provider "azurerm" {
  features {}

}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80.0"
    }
  }
}



module "backend_storage" {
  source              = "./modules/backend-storage"
  resource_group_name = var.resource_group_name
  location            = var.location
  storage_account_name = var.storage_account_name
  container_name      = var.container_name
}

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  subnets             = var.subnets
}

module "aks_test" {
  source              = "./modules/aks-cluster"
  environment         = "test"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.subnet_ids["test"]
}

module "aks_prod" {
  source              = "./modules/aks-cluster"
  environment         = "prod"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.subnet_ids["prod"]
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name            = var.acr_name
}

module "redis_test" {
  source              = "./modules/redis"
  environment         = "test"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "redis_prod" {
  source              = "./modules/redis"
  environment         = "prod"
  resource_group_name = var.resource_group_name
  location            = var.location
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

