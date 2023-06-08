data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "key_vault" {
  name                = var.key
  location            = var.location
  resource_group_name = var.rg-name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
  network_acls {
    default_action = "Deny"
    bypass = "AzureServices" 
  }
}
