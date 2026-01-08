output "alb_arn" {
  value = aws_lb.name.arn
}

output "alb_dns_name" {
  value = aws_lb.name.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.name.arn
}