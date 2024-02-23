module "rgroup-01235433" {
  source   = "./modules/rgroup-01235433"
  rg_name  = "n01235433-RG"
  location = "canadacentral"
}
module "network-01235433" {
  source         = "./modules/network-01235433"
  resource_group = module.rgroup-01235433.rg_output.name
  location       = module.rgroup-01235433.rg_output.location
  vnet_name      = "n01235433-VNET"
  vnet_space     = ["10.0.0.0/16"]
  subnet_name    = "n01235433-SUBNET"
  subnet_space   = ["10.0.0.0/24"]
  nsg_name       = "n01235433-NSG"
}
module "common-01235433" {
  source           = "./modules/common-01235433"
  resource_group   = module.rgroup-01235433.rg_output.name
  location         = module.rgroup-01235433.rg_output.location
  rsv_sku          = "Standard"
  sa_acct_tier     = "Standard"
  sa_acct_rep_type = "LRS"
}
module "vmlinux-01235433" {
  source               = "./modules/vmlinux-01235433"
  nb_count             = "2"
  resource_group_name  = module.rgroup-01235433.rg_output.name
  location             = module.rgroup-01235433.rg_output.location
  avs_linux            = "n01235433-AVSLINUX"
  size_linux           = "Standard_B1ms"
  admin_username_linux = "n01235433"
  public_key           = "C:\\Users\\cutbr\\.ssh\\id_rsa.pub"
  priv_key             = "C:\\Users\\cutbr\\.ssh\\id_rsa"
  vm_linux_name = {
    n01235433-vmlinux1 = ""
    n01235433-vmlinux2 = ""
    n01235433-vmlinux3 = ""
  }
  os_disk_attr_linux = {
    storage_acct_type = "Premium_LRS"
    disk_size         = "32"
    caching           = "ReadWrite"
  }
  os_info_linux = {
    publisher = "cognosys"
    offer     = "centos-8-2-free"
    sku       = "centos-8-2-free"
    version   = "latest"
  }
  subnet_id = module.network-01235433.subnet_output.id
}
/*module "windows" {
  source         = "./modules/windows"
  resource_group_name = module.rg.rg_win_output.name
  location = module.rg.rg_win_output.location
  avs_win = "avs-win"
  vm_win_name = {
    n01235433-w-vm1 = "Standard_B1s"
    n01235433-w-vm2 = "Standard_B1ms"
  }
  os_disk_attr_win = {
    storage_acct_type = "StandardSSD_LRS"
    disk_size = "128"
    caching = "ReadWrite"
  }
  os_info_win = {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-Datacenter"
    version = "latest"
  }
  subnet2_id = module.network.subnet2_output.id
}
*/