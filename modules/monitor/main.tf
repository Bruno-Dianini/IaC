resource "azurerm_log_analytics_workspace" "example" {
  name                = var.monitora
  location            = var.location
  resource_group_name = var.rg-name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}