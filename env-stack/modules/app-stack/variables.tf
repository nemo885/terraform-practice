variable "db_password" {
    type = string
    sensitive = true

  
}

variable "env_name" {
    type = string
  
}
 
variable "app_port" {
    type = number
  
}

variable "postgres_version" {
    type = string
  
}