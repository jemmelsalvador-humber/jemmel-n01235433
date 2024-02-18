output "rg_net_name_output" {
  value = module.rg.rg_net_output.name
}
output "rg_vm_linux_name_output" {
  value = module.rg.rg_linux_output.name
}
output "rg_win_name_output" {
  value = module.rg.rg_win_output.name
}
output "vnet_name_output" {
  value = module.network.vnet_output.name
}
output "vnet_address_space_output" {
  value = module.network.vnet_output.address_space
}
output "subnet1_name_output" {
  value = module.network.subnet1_output.name
}
output "subnet1_address_space_output" {
  value = module.network.subnet1_output.address_prefixes
}
output "subnet2_name_output" {
  value = module.network.subnet2_output.name
}
output "subnet2_address_space_output" {
  value = module.network.subnet2_output.address_prefixes
}
output "nsg1_name_output" {
  value = module.network.nsg1_output.name
}
output "nsg2_name_output" {
  value = module.network.nsg2_output.name
}
output "avs_vm_linux_name_output" {
  value = module.linux.avs_linux_output.name
}
output "vm_linux_hostnames_output" {
  value = module.linux.vm_linux_hostname_output
}
output "vm_linux_fqdns_output" {
  value = module.linux.vm_linux_fqdn_output
}
output "vm_linux_private_ips_output" {
  value = module.linux.vm_linux_private_ip_output
}
output "vm_linux_public_ips_output" {
  value = module.linux.vm_linux_public_ip_output
}
output "avs_win_name_output" {
  value = module.windows.avs_win_output.name
}
output "vm_win_hostnames_output" {
  value = module.windows.vm_win_hostname_output
}
output "vm_win_fqdns_output" {
  value = module.windows.vm_win_fqdn_output
}
output "vm_win_private_ips_output" {
  value = module.windows.vm_win_private_ip_output
}
output "vm_win_public_ips_output" {
  value = module.windows.vm_win_public_ip_output
}