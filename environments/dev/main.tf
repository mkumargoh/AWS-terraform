locals {
  common_tags = {
    Name = "${var.env_name}"
    Environment = var.env_name
  }
}

module "vpc" {
  source = "../../modules/networking/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs

  tags = local.common_tags
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

module "security_group" {
  source = "../../modules/networking/security"

  vpc_id             = module.vpc.vpc_id
  allowed_ssh_cidr   = var.allowed_ssh_cidr
  allowed_http_cidr  = var.allowed_http_cidr

  tags = local.common_tags
}

module "ec2_instances" {
  source = "../../modules/compute/ec2"
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name
  security_group_ids = module.security_group.security_group_ids
  subnet_id = module.vpc.public_subnet_ids[0]
  tags = local.common_tags
}

module "efs" {
  source = "../../modules/storage/efs"
  subnet_ids = module.vpc.private_subnet_ids
  tags = local.common_tags
}