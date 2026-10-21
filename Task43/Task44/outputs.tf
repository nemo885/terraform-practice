output "servers" {
  value = { for name, s in var.servers : name => "localhost:${s.external}" }
}

