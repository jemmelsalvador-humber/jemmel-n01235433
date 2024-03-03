locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Jemmel.Salvador"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
variable "rg_name" {}
variable "location" {}
variable "vm_linux_nic_ids" {
  type = map(string)
}