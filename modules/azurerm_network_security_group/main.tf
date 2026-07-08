resource "azurerm_network_security_group" "nsg_d" {
    for_each            = var.nsg_details

    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    location            = each.value.location

    dynamic "security_rule" {
        for_each        = each.value.security_rules

        content {
          name                       = security_rule.value.name
          protocol                   = security_rule.value.protocol
          access                     = security_rule.value.access
          priority                   = security_rule.value.priority
          direction                  = security_rule.value.direction
          source_port_range          = security_rule.value.source_port_range
          destination_port_range     = security_rule.value.destination_port_range
          source_address_prefix      = security_rule.value.source_address_prefix
          destination_address_prefix = security_rule.value.destination_address_prefix
        
    }
  
}

}