variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
  default = []
}

variable "allowed_ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "allowed_http_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "tags" {
  type = map(string)
  default = { Name = "example" }
}