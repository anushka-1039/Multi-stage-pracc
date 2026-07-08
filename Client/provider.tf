terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "4.79.0"
      }
    }

    backend "azurerm" {
        resource_group_name = "umbrella"
        storage_account_name = "itsisraningtoday2"
        container_name = "container"
        key = "terraform.tfstate"
    }
}


provider "azurerm" {
    features {
    }
}
