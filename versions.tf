terraform {
  
  required_version = "~> 1.0"
  required_providers {
    terraform = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.9"
    }
  }
}