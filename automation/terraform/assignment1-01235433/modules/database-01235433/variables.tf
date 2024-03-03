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
variable "db_sku_name" {}
variable "db_storage_mb" {}
variable "db_version" {}
variable "db_ssl_enforcement_enabled" {}
variable "db_charset" {}
variable "db_collation" {}
variable "db_admin_login" {}
variable "db_admin_pw" {}