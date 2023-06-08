variable "rg-name" {
  type    = string
  default = "kumulus-test"
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

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

variable "rulesname" {
  type    = string
  default = "mykumulssecut"
}

variable "vmwindows" {
  type    = string
  default = "my-windows-vm"
}

variable "vmscaleset" {
  type    = string
  default = "kumumach"
}

variable "nsg" {
  type    = string
  default = "mykumulssecut"
}

variable "key" {
  type    = string
  default = "kummuluskey"
}

variable "storage" {
  type    = string
  default = "storageakumuluas"
}

variable "datafactory" {
  type    = string
  default = "kumulusdatafac"
}

variable "kumuluslinked" {
  type    = string
  default = "kumuluslinked"
}
variable "datapipeline" {
  type    = string
  default = "datapipeline"
}

variable "cosmosdb" {
  type    = string
  default = "cosmoskumulus"
}