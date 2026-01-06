# resource "aws_efs_file_system" "this" {
#   encrypted = true
#   tags = {
#     Name = "${var.tags["Name"]}-efs"
#   }
# }

# resource "aws_efs_mount_target" "this" {
#   for_each = toset(var.subnet_ids)
#   file_system_id = aws_efs_file_system.this.id
#   subnet_id      = each.value
#   security_groups = []
# }

resource "aws_efs_file_system" "this" {
  encrypted = true

  tags = {
    Name = "${var.tags["Name"]}-efs"
  }
}

resource "aws_efs_mount_target" "this" {
  for_each = {
    for idx, subnet_id in var.subnet_ids :
    idx => subnet_id
  }

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = each.value
  security_groups = []
}