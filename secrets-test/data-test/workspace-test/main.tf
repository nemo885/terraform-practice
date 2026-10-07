resource "terraform_data" "env" {
  input = "Запущено в окружении: ${terraform.workspace}"
}

output "current_env" {
  value = terraform_data.env.output
}