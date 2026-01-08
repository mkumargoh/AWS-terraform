variable "ami" {
  description = "AMI ID to use"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID to launch into"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group ids"
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = ""
}

variable "tags" {
  type = map(string)
  default = { Name = "example" }
}
variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 1
}