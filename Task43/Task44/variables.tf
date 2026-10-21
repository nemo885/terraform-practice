variable "servers" {
  description = "Три сервиса"
  type = map(object({
    image    = string
    external = number
    internal = number
  }))

  default = {
    web = {
      image    = "nginx:alpine"
      external = 8081
      internal = 80
    }
    api = {
      image    = "httpd:alpine"
      external = 8082
      internal = 80
    }
    cache = {
      image    = "redis:7"
      external = 6380
      internal = 6379
    }
  }

  validation {
    condition     = length([for s in values(var.servers) : s.external]) == length(distinct([for s in values(var.servers) : s.external]))
    error_message = "Порты хоста (external) у сервисов не должны повторяться."
  }
}