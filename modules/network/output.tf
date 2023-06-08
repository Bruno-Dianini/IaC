output "network_interface_ids" {
  value = azurerm_network_interface.nic.id
}

output "network_subnet_ids" {
  value = azurerm_subnet.subnet.id
}

output "loads" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

output "networksecuritygroup_id" {
  value = azurerm_network_security_group.nsg.id
}