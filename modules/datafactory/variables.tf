variable "rg-name" {
  type    = string
  default = "kumulus-test"
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "datafactory" {
  type = string
  default = "kumulusdatafac"
}

variable "kumuluslinked" {
  type = string
  default = "kumuluslinked"
}
variable "datapipeline" {
  type = string
  default = "datapipeline"
}

variable "azurerm_storage_account" {}