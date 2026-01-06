terraform {
  backend "s3" {
    bucket         = "terraform-manish-state-file"
    key            = "terraform/dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}