provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "devops_resources" {
  name     = "${var.name}"
  location = "${var.location}"
}
