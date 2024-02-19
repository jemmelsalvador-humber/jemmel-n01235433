output "avs_linux_output" {
  value = azurerm_availability_set.n01235433-AVSLINUX
}
output "vm_linux_hostname_output" {
  value = values(azurerm_linux_virtual_machine.n01235433-VMLINUX)[*].computer_name
}
output "vm_linux_fqdn_output" {
  value = values(azurerm_public_ip.n01235433-PIPLINUX)[*].fqdn
}
output "vm_linux_private_ip_output" {
  value = values(azurerm_linux_virtual_machine.n01235433-VMLINUX)[*].private_ip_address
}
output "vm_linux_public_ip_output" {
  value = values(azurerm_linux_virtual_machine.n01235433-VMLINUX)[*].public_ip_address
}