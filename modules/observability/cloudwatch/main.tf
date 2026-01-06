variable "log_group_name" {
  type    = string
  default = "/aws/example"
}

resource "aws_cloudwatch_log_group" "this" {
  name              = var.log_group_name
  retention_in_days = 14
  tags = {
    Name = var.log_group_name
  }
}