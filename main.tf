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