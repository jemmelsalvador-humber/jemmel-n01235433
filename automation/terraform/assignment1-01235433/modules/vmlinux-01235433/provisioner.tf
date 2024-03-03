resource "null_resource" "linux-provisioner" {
  for_each   = var.vm_linux_name
  depends_on = [azurerm_linux_virtual_machine.n01235433-VMLINUX]
  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]
    connection {
      type        = "ssh"
      user        = var.admin_username_linux
      private_key = file(var.priv_key)
      host        = azurerm_public_ip.n01235433-PIPLINUX[each.key].fqdn
    }
  }
}