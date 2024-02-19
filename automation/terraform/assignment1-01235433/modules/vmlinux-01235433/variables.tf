locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Jemmel.Salvador"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
variable "nb_count" {}
variable "resource_group_name" {}
variable "location" {}
variable "avs_linux" {}
variable "size_linux" {}
variable "admin_username_linux" {}
variable "public_key" {}
variable "priv_key" {}
variable "vm_linux_name" {
  type = map(string)
}
variable "os_disk_attr_linux" {
  type = map(string)
}
variable "os_info_linux" {
  type = map(string)
}
variable "subnet_id" {}