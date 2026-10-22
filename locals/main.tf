terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {}

resource "docker_container" "tf-nginx" {
  image  = docker_image.nginx.image_id
  name   = local.name
  memory = local.memory

  ports {
    internal = 80
    external = local.ports
  }

  labels {
    label = "environment"
    value = var.environment
  }
  labels {
    label = "managed_by"
    value = "opentofu"
  }
}



resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}


locals {
  name = "nginx-${var.environment}"
  memory_by_env = {
    dev   = 128
    stage = 256
    prod  = 512
  }
  memory = local.memory_by_env[var.environment]

  port_by_env = {
    dev   = 8091
    stage = 8092
    prod  = 8093
  }
  ports = local.port_by_env[var.environment]

}





