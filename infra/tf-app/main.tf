provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "cst8918-final-project-group-FP10"
  location = "East US"
}

# Pass the resource group to modules
module "backend" {
  source               = "../modules/backend"
  resource_group_name  = azurerm_resource_group.main.name
  storage_account_name = "fp10backendstorage"
  container_name       = "tfstate"
  location             = azurerm_resource_group.main.location
}

module "network" {
  source              = "../modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = "final-project-vnet"
}

module "aks" {
  source              = "../modules/aks"
  resource_group_name = azurerm_resource_group.main.name
  aks_name            = "fp10-aks-cluster"
  location            = azurerm_resource_group.main.location
}

module "app" {
  source              = "../modules/app"
  resource_group_name = azurerm_resource_group.main.name
  app_name            = "fp10-weather-app"
  location            = azurerm_resource_group.main.location
  acr_name            = "fp10acr"
}
