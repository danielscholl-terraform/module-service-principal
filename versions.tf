##############################################################
# This module allows the creation of a Service Principal
##############################################################

terraform {
  required_version = ">= 1.1.1"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.13.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}
