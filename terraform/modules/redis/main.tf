resource "azurerm_redis_cache" "redis" {
  name                 = "redis-${var.environment}-${random_string.suffix.result}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  capacity             = 0
  family               = "C"
  sku_name             = "Basic"
  non_ssl_port_enabled = true
  minimum_tls_version  = "1.2"
  redis_configuration {
    maxmemory_policy = "allkeys-lru"
  }
  tags = {
    environment = var.environment
  }
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}
