variable "env_name" {
  type = string

  validation {
    condition     = contains(["dev", "stage"], var.env_name)
    error_message = "env_name must be dev or stage."
  }
}

variable "app_port" {
  type = number
}

variable "postgres_version" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}