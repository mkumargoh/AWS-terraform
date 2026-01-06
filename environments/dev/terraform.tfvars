aws_region       = "ap-south-1"
env_name         = "dev"
vpc_cidr         = "192.168.0.0/16"
public_subnets   = ["192.168.1.0/24", "192.168.2.0/24"]
private_subnets  = ["192.168.100.0/24", "192.168.101.0/24"]
azs              = ["ap-south-1a", "ap-south-1b"]
allowed_ssh_cidr = "0.0.0.0/0" # example
allowed_http_cidr = "0.0.0.0/0"

instance_type   = "t2.micro"
key_name        = "my-key-pair" # Replace with your actual key pair name