variable "resource_group_name" {
  description = "The name of the resource group where modules resources will be deployed. The resource group location will be used for all resources in this module as well."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
}

variable "databricks" {
  description = "New Databricks Workspace resource"
  type = object({
    name                     = string
    sku                      = string
    storage_account_sku_name = string
    managed_resource_group_name = string

  })

  default = {
    name                     = "lens-databricks"
    sku                      = "premium"
    storage_account_sku_name = "Standard-GRS"
    managed_resource_group_name = "lens-databricks-managed-resource-group-name"
  }
  validation {
    condition     = (
      length(var.databricks.name) <= 30 &&
      length(var.databricks.name) >= 3 &&
      length(regexall("[\\.()*!@#$%^&:;'\"?/./]",var.databricks.name)) == 0 &&
      lower(var.databricks.name) == var.databricks.name
    )
    error_message = "Only alphanumeric characters, underscores, and hyphens are allowed, and the name must be 1-30 characters long"
  }
  validation {
    condition = contains(["standard","premium","trial"], var.databricks.sku)
    error_message = "The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial"
  }
}

variable "virtual_network" {
  description = "Integrate Databricks with Azure Virtual Network"

  type = object({
    enabled                                              = bool
    virtual_network_id                                   = string
    private_subnet_name                                  = string
    private_subnet_network_security_group_association_id = string
    public_subnet_name                                   = string
    public_subnet_network_security_group_association_id  = string
  })

  default = {
    enabled                                              = false
    virtual_network_id                                   = ""
    private_subnet_name                                  = ""
    private_subnet_network_security_group_association_id = ""
    public_subnet_name                                   = ""
    public_subnet_network_security_group_association_id  = ""
  }
}

variable "tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    Team        = "analytics",
    Application = "analytics",
    Department  = "it"
  }
}