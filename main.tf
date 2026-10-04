variable "message" {
  type    = string
  default = "Hello from OpenTofu on Windows!"
}

resource "terraform_data" "hello" {
  input            = var.message
  triggers_replace = [var.message]

  provisioner "local-exec" {
    command = "echo ${self.input} > hello.txt"
  }
}

output "message" {
  value = terraform_data.hello.input
}

module "greet_anna" {
  source = "./modules/greeting"
  name   = "Anny"
}

module "greet_boris" {
  source = "./modules/greeting"
  name   = "Boris"
}

output "anna_text" {
  value = module.greet_anna.text
}

output "boris_text" {
  value = module.greet_boris.text
}