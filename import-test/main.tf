terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "demo" {
  name = "demo-net"
}

import {
  to = docker_network.demo
  id = "292abc3898f7"
}