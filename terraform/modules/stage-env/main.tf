module "virtual_machine_module" {
  source = "/opt/terraform-virtual-modules/modules/virtual_machine_module"
  resource_group_name = "devops-rg-stage"
  vnet_name = "devops-vnet-stage"
  subnet_name = "devops-subnet-stage"
  nic_name = "devops-nic-stage"
  pip_name = "devops-pip-stage"
  vm_name = "webserver-stage"
  nsg_name = "devops-nsg-stage"
}
