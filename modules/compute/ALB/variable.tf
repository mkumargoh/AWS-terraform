variable "name" {
  description = "The name of the ALB"
  type        = string
}
variable "subnet_ids" {
  description = "List of subnet IDs to attach to the ALB"
  type        = list(string)
  default     = []
}
variable "security_group_ids" {
  description = "List of security group IDs to associate with the ALB"
  type        = list(string)
  default     = []
}
variable "tags" {
  description = "A map of tags to assign to the ALB"
  type        = map(string)
  default     = { Name = "example" }
  
}
variable "vpc_id" {
  description = "The VPC ID where the ALB will be deployed"
  type        = string
  
}
variable "instance_ids" {
  description = "The ID of the instance to attach to the target group"
  type        = list(string)
}