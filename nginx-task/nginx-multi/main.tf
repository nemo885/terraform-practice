terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {
}
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = false
}


resource "docker_container" "site" {
  for_each = var.sites

  name  = "tf-${each.key}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = each.value
  }

  env = ["SITE_NAME=${each.key}"]
}



