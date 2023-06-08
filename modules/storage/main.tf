resource "azurerm_storage_account" "kumulustorage" {
  name                = var.storage
  resource_group_name = var.rg-name

  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [var.azurerm_subnet_ids]
  }

}