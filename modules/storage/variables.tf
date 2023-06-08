variable "rg-name" {
  type    = string
  default = "kumulus-test"
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "storage" {
  type = string
  default = "storageakumuluas"
}

variable "azurerm_storage_account" {}

variable "azurerm_subnet_ids" {}