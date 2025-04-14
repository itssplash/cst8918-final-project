resource "azurerm_storage_account" "backend" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend" {
  name                  = var.container_name
  storage_account_name = azurerm_storage_account.backend.name
  container_access_type = "private"
}
