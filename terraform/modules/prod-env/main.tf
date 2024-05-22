module "virtual_machine_module" {
  source = "/opt/terraform-virtual-modules/modules/virtual_machine_module"
  resource_group_name = "devops-rg-prod"
  vnet_name = "devops-vnet-prod"
  subnet_name = "devops-subnet-prod"
  nic_name = "devops-nic-prod"
  pip_name = "devops-pip-prod"
  vm_name = "webserver-prod"
  nsg_name = "devops-nsg-prod"
}


