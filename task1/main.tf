locals {
  users = {
    anna   = "admin"
    boris  = "dev"
    clara  = "dev"
    dmitry = "admin"
  }
}
 
resource "terraform_data" "user" {
    for_each = local.users
    input    = "${each.key}: ${each.value}"
} 

output "admins" {
  value = [for name, role in local.users : name if role == "admin"]
}

output "roles_count" {
  value = length(local.users)
}