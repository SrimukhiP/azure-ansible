resource "azurerm_resource_group" "devops_resources" {
  name     = var.resource_group_name
  location = "West Europe"
}
