output azure_storage_blob_account {
  value = azurerm_storage_account.kamelets.primary_access_key
  sensitive = true
}
