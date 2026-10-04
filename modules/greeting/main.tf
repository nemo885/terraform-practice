variable "name" {
  type = string
}

resource "terraform_data" "this" {
  input = "Hello, ${var.name}!"
}

output "text" {
  value = terraform_data.this.input
}