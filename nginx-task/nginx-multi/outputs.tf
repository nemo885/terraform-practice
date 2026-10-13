output "urls" {
  value = { for site, port in var.sites : site => "http://localhost:${port}" }


}