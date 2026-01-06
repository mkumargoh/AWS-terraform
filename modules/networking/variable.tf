variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.100.0/24", "10.0.101.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "tags" {
  type = map(string)
  default = { Name = "example" }
}

variable "allowed_ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "allowed_http_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

