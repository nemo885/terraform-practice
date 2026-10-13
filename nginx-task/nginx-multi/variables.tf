variable "sites" {
  type = map(number)
  default = {
    wiki = 8104
    blog = 8101
    shop = 8102
    docs = 8103
  }

}