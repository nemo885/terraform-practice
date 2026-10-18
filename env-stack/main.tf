terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

module "app" {
  source = "./modules/app-stack"

  env_name         = var.env_name
  app_port         = var.app_port
  postgres_version = var.postgres_version
  db_password      = var.db_password
}