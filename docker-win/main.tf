terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {}

locals {
  sites = {
    dev   = 8090
    stage = 8091
    prod  = 8092
  }
}

module "web" {
  source   = "./modules/web"
  for_each = local.sites

  name = each.key
  port = each.value
}

output "urls" {
  value = { for k, m in module.web : k => m.url }
}