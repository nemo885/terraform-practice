output "nginx_url" {
  value = "http://localhost:${local.ports}"
}

output "container_name" {
  value = local.name
}