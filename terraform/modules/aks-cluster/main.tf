
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.environment}"


  default_node_pool {
    name                = "default"
    vm_size             = "Standard_B2s"
    auto_scaling_enabled = var.environment == "prod" ? true : false
    node_count          = var.environment == "prod" ? null : 1
    min_count           = var.environment == "prod" ? 1 : null
    max_count           = var.environment == "prod" ? 3 : null
  }

  identity {
    type = "SystemAssigned"
  }


  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = "10.0.0.10"
    service_cidr       = "10.0.0.0/16"
  }

  tags = {
    environment = var.environment
  }
}
