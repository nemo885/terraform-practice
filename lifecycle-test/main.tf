resource "terraform_data" "first" {
  input = "первый"

  provisioner "local-exec" {
    command = "echo creating first"
  }
}

resource "terraform_data" "second" {
  input      = "второй"
  

  provisioner "local-exec" {
    command = "echo creating second"
  }
}