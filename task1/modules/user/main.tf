variable "name" {
  type = string
}

variable "role" {
  type = string
}

resource "terraform_data" "this" {
  input = "${var.name}: ${var.role}"
}

output "info" {
  value = terraform_data.this.input
}

