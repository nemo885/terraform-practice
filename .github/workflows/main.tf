resource "terraform_data" "ci_demo" {
  input = "Тест CI/CD пайплайна в GitHub Actions!"
}

output "pipeline_status" {
  value = terraform_data.ci_demo.output
}