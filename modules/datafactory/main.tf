resource "azurerm_data_factory" "kumulusdataf" {
  name                   = var.datafactory
  location               = var.location
  resource_group_name    = var.rg-name
  public_network_enabled = true
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "kumuluslinked" {
  name              = var.kumuluslinked
  data_factory_id   = azurerm_data_factory.kumulusdataf.id
  connection_string = var.azurerm_storage_account
}


resource "azurerm_data_factory_pipeline" "kumuluspipeline" {
  name            = var.datapipeline
  data_factory_id = azurerm_data_factory.kumulusdataf.id

}