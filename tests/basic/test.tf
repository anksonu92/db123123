terraform {
  required_version = ">= 1.0.0"

  required_providers {
    terraform = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.9"
    }
  }
}

provider "azuread" {}
provider "azurerm" {
  storage_use_azuread        = true
  skip_provider_registration = false
  features {}
}



resource "azurerm_resource_group" "test" {
  location = "eastus2"
  name     = "lens-databricks-test"
}


module "lens_databricks" {
  source = "../../"

  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
}


output "workspace_url" {
  value = module.lens_databricks.workspace_url
}

output "workspace_id" {
  value = module.lens_databricks.workspace_id
}

