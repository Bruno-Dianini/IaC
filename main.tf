

module "locals" {
  source   = "./modules/locals"
  rg-name  = var.rg-name
  location = var.location
}

module "net" {
  source                  = "./modules/network"
  rg-name                 = var.rg-name
  network_interface_ids   = module.net.network_interface_ids
  azurerm_subnet_ids      = module.net.network_subnet_ids
  loads                   = module.net.loads
  networksecuritygroup_id = module.net.networksecuritygroup_id


  depends_on = [module.locals]

}

module "storage" {
  source                  = "./modules/storage"
  azurerm_subnet_ids      = module.net.network_subnet_ids
  azurerm_storage_account = module.storage.azurerm_storage_account

  depends_on = [module.net]
}

module "datafactory" {
  source                  = "./modules/datafactory"
  azurerm_storage_account = module.storage.azurerm_storage_account

  depends_on = [module.storage]
}


module "virtual_machine" {
  source                = "./modules/machine"
  rg-name               = var.rg-name
  network_interface_ids = module.net.network_interface_ids

  depends_on = [module.datafactory]

}

module "virtualscale" {
  source                  = "./modules/machinescaleset"
  rg-name                 = var.rg-name
  networksecuritygroup_id = module.net.networksecuritygroup_id
  azurerm_subnet_ids      = module.net.network_subnet_ids
  loads                   = module.net.loads

  depends_on = [module.virtual_machine]

}

module "cosmosdb" {
  source = "./modules/cosmodb"

  depends_on = [module.virtualscale]
}

module "key_vault" {
  source  = "./modules/keyvault"
  rg-name = var.rg-name

  depends_on = [module.cosmosdb]
}

module "monitora" {
  source = "./modules/monitor"

  depends_on = [module.key_vault]
}
