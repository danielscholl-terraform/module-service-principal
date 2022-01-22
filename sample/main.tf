provider "azurerm" {
  features {}
}

provider "azuread" {

}

module "resource_group" {
  source = "git::https://github.com/danielscholl-terraform/module-resource-group?ref=v1.0.0"

  name     = "iac-terraform"
  location = "eastus2"

  resource_tags = {
    iac = "terraform"
  }
}

module "service_principal" {
  source = "../"

  name   = format("iac-terraform-%s", module.resource_group.random)
  role   = "Contributor"
  scopes = [module.resource_group.id]

  api_permissions = [
    {
      name = "Microsoft Graph"
      app_roles = [
        "Directory.Read.All"
      ]
    }
  ]
}
