resource "azurerm_databricks_workspace" "main" {
  name                = var.databricks.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.databricks.sku
  

  tags                = var.tags

  custom_parameters {
    no_public_ip                                         = var.virtual_network.enabled
    virtual_network_id                                   = var.virtual_network.enabled ? var.virtual_network.virtual_network_id : null
    private_subnet_name                                  = var.virtual_network.enabled ? var.virtual_network.private_subnet_name : null
    public_subnet_name                                   = var.virtual_network.enabled ? var.virtual_network.public_subnet_name : null
    private_subnet_network_security_group_association_id = var.virtual_network.enabled ? var.virtual_network.private_subnet_network_security_group_association_id : null
    public_subnet_network_security_group_association_id  = var.virtual_network.enabled ? var.virtual_network.public_subnet_network_security_group_association_id : null
  }
}
