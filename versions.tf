terraform {
  required_version = ">= 1.11.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
       version = ">= 4.29.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  tenant_id       = var.azure_tenant_id
  use_oidc        = true
  features {}
}