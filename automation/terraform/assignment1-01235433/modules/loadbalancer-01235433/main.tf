resource "azurerm_public_ip" "n01235433-PIPLB" {
  name                = "n01235433-PIPLB"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = local.common_tags
}
resource "azurerm_lb" "n01235433-LB" {
  name                = "n01235433-LB"
  resource_group_name = var.rg_name
  location            = var.location
  tags                = local.common_tags
  frontend_ip_configuration {
    name                 = "n01235433-LBIPCONFIG"
    public_ip_address_id = azurerm_public_ip.n01235433-PIPLB.id
  }
}
resource "azurerm_lb_backend_address_pool" "n01235433-LBBE" {
  name            = "n01235433-LBBE"
  loadbalancer_id = azurerm_lb.n01235433-LB.id
}
resource "azurerm_network_interface_backend_address_pool_association" "n01235433-LBASSOC" {
  for_each                = var.vm_linux_nic_ids
  network_interface_id    = each.value
  ip_configuration_name   = "${each.key}-ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.n01235433-LBBE.id
}