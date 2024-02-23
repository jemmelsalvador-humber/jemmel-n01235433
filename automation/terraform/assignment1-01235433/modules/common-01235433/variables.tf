locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Jemmel.Salvador"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
variable "resource_group" {}
variable "location" {}
variable "rsv_sku" {}
variable "sa_acct_tier" {}
variable "sa_acct_rep_type" {}