
resource "azurerm_virtual_network" "network" {
  name                = var.net-name
  address_space       = ["10.0.0.0/16", "192.168.0.0/16"]
  location            = var.location
  resource_group_name = var.rg-name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet-name
  resource_group_name  = var.rg-name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "publicip" {
  name                    = var.public-ip
  location                = var.location
  resource_group_name     = var.rg-name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  domain_name_label       = "vmwinservertf"
}

resource "azurerm_network_interface" "nic" {
  name                = var.interface-name
  location            = var.location
  resource_group_name = var.rg-name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = var.ip-config
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_lb" "lb" {
  name                = var.load-name
  location            = var.location
  resource_group_name = var.rg-name

  frontend_ip_configuration {
    name                 = var.ipfront
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.backpoll
}


resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg
  location            = var.location
  resource_group_name = var.rg-name
}

resource "azurerm_network_security_rule" "regrasdeentrada" {
  for_each                    = var.regras_entrada
  resource_group_name         = var.rg-name
  name                        = "portentrada_${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  protocol                    = "Tcp"
  destination_port_range      = each.value
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "nsgassociacao" {
  subnet_id                 = var.azurerm_subnet_ids
  network_security_group_id = azurerm_network_security_group.nsg.id
}