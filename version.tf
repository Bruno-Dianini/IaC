terraform {
  required_version = "~> 1.7.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.85.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "= 2.19.1"
    }
  }
}
