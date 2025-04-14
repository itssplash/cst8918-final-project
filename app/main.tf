resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"
}

resource "azurerm_redis_cache" "redis" {
  name                = var.redis_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku                 = "Basic"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "app-${var.app_name}"
  kubernetes_version  = "1.32"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }
}
