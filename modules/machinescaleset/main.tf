resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  name                = var.vmscaleset
  location            = var.location
  resource_group_name = var.rg-name
  admin_username      = "adminuser"
  admin_password      = "Password123!"
  sku                 = "Standard_DS2_v2"
  instances           = 4

  network_interface {
    name                          = "kuinterface"
    primary                       = true
    enable_accelerated_networking = true
    network_security_group_id     = var.networksecuritygroup_id
    ip_configuration {
      name                                   = "ku-configuration"
      primary                                = true
      subnet_id                              = var.azurerm_subnet_ids
      load_balancer_backend_address_pool_ids = [var.loads]
    }
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}