module "resource" {
    source = "../modules/azurerm_resource_group"
    rg_details = var.rg_details
}

module "storage" {
    source = "../modules/azurerm_storage_account"
    str_details = var.str_details
    depends_on = [ module.resource ]
}

module "vnet" {
    source = "../modules/azurerm_virtual_network"
    vnet_details = var.vnet_details
    depends_on = [ module.resource ]
}

module "subnet" {
    source = "../modules/azurerm_subnet"
    subnet_details = var.subnet_details
    depends_on = [ module.vnet ]
}

module "security" {
    source = "../modules/azurerm_network_security_group"
    nsg_details = var.nsg_details
    depends_on = [ module.resource ]
}