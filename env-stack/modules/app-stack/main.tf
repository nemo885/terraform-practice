terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

resource "docker_network" "net" {
    name = "${var.env_name}-net"
    
}

resource "docker_image" "postgres" {
    name = "postgres:${var.postgres_version}"
    
}

resource "docker_image" "nginx" {
    name = "nginx:alpine"
  
}


resource  "docker_volume" "pgdata" {
   name = "${var.env_name}-pgdata"  

}

resource "docker_container" "postgres" {
    name = "${var.env_name}-db"
    image = docker_image.postgres.image_id
    env = [
        "POSTGRES_PASSWORD=${var.db_password}"
    ]
    
    networks_advanced {
        name = docker_network.net.name
    }

    volumes {
        volume_name    = docker_volume.pgdata.name
        container_path = "/var/lib/postgresql/data"
    }
   wait = true

 healthcheck {
    test     = ["CMD-SHELL", "pg_isready -U postgres"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
}

  resource "docker_container" "app" {
  name  = "${var.env_name}-app"
  image = docker_image.nginx.image_id

  
  networks_advanced {
    name = docker_network.net.name
  }

  ports {
    internal = 80
    external = var.app_port
  }

  depends_on = [docker_container.postgres]
}

  

