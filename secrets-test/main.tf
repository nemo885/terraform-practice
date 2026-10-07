variable "db_password" {
  type      = string
  sensitive = true
  default   = "supersecret123"
}

resource "terraform_data" "db" {
  input = var.db_password
}

output "password" {
  value     = var.db_password
  sensitive = true
}

terraform {
  encryption {
    key_provider "pbkdf2" "my_passphrase" {
      passphrase = "my-extra-secret-key-123" # Пароль для шифрования tfstate
    }

    method "aes_gcm" "my_method" {
      keys = key_provider.pbkdf2.my_passphrase
    }

    state {
      method = method.aes_gcm.my_method
    }
  }
}