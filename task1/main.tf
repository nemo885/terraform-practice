locals {
  users = {
    anna   ="admin"
    boris  = "dev"
    clara  = "dev"
    dmitry = "admin"
  }
}

module "user" {
  source   = "./modules/user"
  for_each = local.users

  name = each.key
  role = each.value
}

output "admins" {
  value = [for name, role in local.users : name if role == "admin"]
}

output "roles_count" {
  value = length(local.users)
}

output "infos" {
  value = { for k, m in module.user : k => m.info }
}