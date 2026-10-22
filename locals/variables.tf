variable "environment" {
  default = "dev"
  type    = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "env_name must be dev or stage or prod."
  }

}


