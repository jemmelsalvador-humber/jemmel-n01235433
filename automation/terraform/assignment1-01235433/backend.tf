terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01235433RG"
    storage_account_name = "tfstate01235433sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}