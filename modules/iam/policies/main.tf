variable "policy_name" {
  type = string
}
variable "policy_document" {
  type = string
}

resource "aws_iam_policy" "this" {
  name   = var.policy_name
  policy = var.policy_document
}