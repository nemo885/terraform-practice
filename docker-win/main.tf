terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {}

module "web_dev" {
  source = "./modules/web"
  name   = "dev"
  port   = 8090
}

module "web_stage" {
  source = "./modules/web"
  name   = "stage"
  port   = 8093
}

output "dev_url" {
  value = module.web_dev.url
}

output "stage_url" {
  value = module.web_stage.url
}