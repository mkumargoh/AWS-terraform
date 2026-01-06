variable "assume_role_policy" {
  type = string
}

variable "name" {
  type = string
}

resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = var.assume_role_policy
  tags = {
    Name = var.name
  }
}