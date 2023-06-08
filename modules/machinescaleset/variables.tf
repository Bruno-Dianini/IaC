variable "rg-name" {
  type    = string
  default = "kumulus-test"
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "vmscaleset" {
  type    = string
  default = "kumumach"
}

variable "networksecuritygroup_id" {}
variable "azurerm_subnet_ids" {}
variable "loads" {}
