variable "product" {
  description = "Name of product / project for which to create the backend resources"
}

variable "prefix_with_product" {
  description = "Whether to prepend the lock table name with `<product>-`"
}

variable "account" {
  description = "Type of AWS account in which to create the backend. Should be either `prod` or `nonprod`"
}

variable "tags" {
  description = "AWS tags to add to the created backend resources"

  type = "map"
  default = {}
}
