terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {
}
 resource "docker_image" "nginx" {
    name    = "nginx:alpine"
    keep_locally = false
 }
  


resource "docker_container" "tf-nginx" {
    image = docker_image.nginx.image_id
    name = "tf-nginx"
    ports {
        internal = 80
        external = var.host_port
    }
  
  env = [
    "ENV_NAME=${var.env_name}"
  ]


}