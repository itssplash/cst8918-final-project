resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/14"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  for_each = {
    "prod"  = "10.0.0.0/16"
    "test"  = "10.1.0.0/16"
    "dev"   = "10.2.0.0/16"
    "admin" = "10.3.0.0/16"
  }

  name                 = "${each.key}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}
