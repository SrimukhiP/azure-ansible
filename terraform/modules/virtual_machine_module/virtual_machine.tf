resource "azurerm_linux_virtual_machine" "devops-virtual-machine" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.devops_resources.name
  location            = azurerm_resource_group.devops_resources.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "Adminuser@123"
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.devops-nic.id]
  user_data           = base64encode(data.template_file.devops-web-server.rendered)
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_network_security_group" "devops-nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.devops_resources.location
  resource_group_name = azurerm_resource_group.devops_resources.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

data "template_file" "devops-web-server" {
     template = file("/opt/terraform-virtual-modules/modules/virtual_machine_module/azure_data.sh")
}



