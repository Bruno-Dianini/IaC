variable "net-name" {
  type    = string
  default = "kumulus-net"
}

variable "subnet-name" {
  type    = string
  default = "kumulus-subnet"
}

variable "public-ip" {
  type    = string
  default = "kumulus-ippublic"
}

variable "interface-name" {
  type    = string
  default = "kumulusinterface"
}

variable "ip-config" {
  type    = string
  default = "my-ip-configuration"
}

variable "load-name" {
  type    = string
  default = "my-load-balancer"
}

variable "ipfront" {
  type    = string
  default = "my-frontend-ip-config"
}

variable "backpoll" {
  type    = string
  default = "my-backend-pool"
}

variable "rg-name" {
  type    = string
  default = "kumulus-test"
}

variable "nsg" {
  type = string
  default = "mykumulssecut"
}


variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "network_interface_ids" {}
variable "azurerm_subnet_ids" {}
variable "loads" {}
variable "networksecuritygroup_id" {}


variable "regras_entrada" {
  type = map(any)
  default = {
    101 = 80
    102 = 443
    103 = 3389
    104 = 22
  }
}
