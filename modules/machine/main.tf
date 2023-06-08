
resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = var.vmwindows
  location            = var.location
  resource_group_name = var.rg-name
  size                = "Standard_DS2_v2"
  allow_extension_operations =   false
  admin_username      = "adminuser"
  admin_password      = "Password123!"

  network_interface_ids = [var.network_interface_ids]

  os_disk {
    name                 = "my-os-disk"
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