# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "kamelets" {
  name     = var.azure_storage_blob_resource_group
  location = var.location
}

resource "azurerm_storage_account" "kamelets" {
  name                     = var.azure_storage_blob_account_name
  resource_group_name      = azurerm_resource_group.kamelets.name
  location                 = azurerm_resource_group.kamelets.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "camelkamelets" {
  name                  = var.azure_storage_blob_container_name
  storage_account_name  = azurerm_storage_account.kamelets.name
  container_access_type = "private"
}
