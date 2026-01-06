output "security_group_ids" {
  value = [aws_security_group.instance_sg.id]
}

output "network_acl_id" {
  value = aws_network_acl.this.id
}