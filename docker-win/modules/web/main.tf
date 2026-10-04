terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

variable "name" {
  type = string
}

variable "port" {
  type = number
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "this" {
  name  = "web-${var.name}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.port
  }
}

output "url" {
  value = "http://localhost:${var.port}"
}