/*
 Top-level networking module that composes vpc + security child modules.
*/
module "vpc" {
  source         = "./vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs            = var.azs
  tags           = var.tags
}

module "security" {
  source            = "./security"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  allowed_http_cidr = var.allowed_http_cidr
  tags              = var.tags
}