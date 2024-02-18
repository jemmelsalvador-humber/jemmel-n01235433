module "rg" {
  source        = "./modules/resource_group"
  rg_net_name   = "rg-net"
  rg_vm_linux_name = "rg-linux"
  rg_win_name   = "rg-win"
  location      = "canadacentral"
}
module "network" {
  source         = "./modules/network"
  resource_group = module.rg.rg_net_output.name
  location       = module.rg.rg_net_output.location
  vnet_name      = "network-vnet"
  vnet_space     = ["10.0.0.0/16"]
  subnet1_name   = "network-subnet1"
  subnet2_name   = "network-subnet2"
  subnet1_space  = ["10.0.0.0/24"]
  subnet2_space  = ["10.0.1.0/24"]
  nsg1_name      = "network-nsg1"
  nsg2_name      = "network-nsg2"
}
module "linux" {
  source         = "./modules/linux"
  nb_count = "2"
  resource_group_name = module.rg.rg_linux_output.name
  location = module.rg.rg_linux_output.location
  avs_linux = "avs-linux"
  vm_linux_name = "n01235433-u-vm"
  size_linux = "Standard_B1s"
  admin_username_linux = "n01235433"
  public_key = "C:\\Users\\cutbr\\.ssh\\id_rsa.pub"
  priv_key = "C:\\Users\\cutbr\\.ssh\\id_rsa"
  os_disk_attr_linux = {
    storage_acct_type = "Premium_LRS"
    disk_size         = "32"
    caching           = "ReadWrite"
  }
  os_info_linux = {
    publisher = "Canonical"
    sku       = "22_04-lts"
    version   = "latest"
  }
  subnet1_id = module.network.subnet1_output.id
}
module "windows" {
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