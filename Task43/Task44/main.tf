terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {}


resource "docker_container" "the_servers" {
  for_each = var.servers
  name     = each.key
  image    = docker_image.the_images[each.key].image_id
  ports {
    internal = each.value.internal
    external = each.value.external
  }

}

resource "docker_image" "the_images" {
  for_each     = var.servers
  name         = each.value.image
  keep_locally = true
}






    