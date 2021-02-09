# Download AWS provider from hashicorp
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  profile = "default"
}

# Use the VPC module
module "vpc" {
  source = "./vpc"
  aws_internet_gateway = module.gateway.aws_internet_gateway
}

# Use the Getaway module
module "gateway" {
  source = "./gateway"
  vpc_id = module.vpc.vpc_id
  aws_public = module.vpc.aws_public.id
  aws_subnet = module.vpc.aws_subnet.id

}

# Use the Security module
module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id
}

# Use the ec2 Instance module
module "ec2" {
  source = "./ec2"
  aws_public = module.vpc.aws_public.id
  aws_subnet = module.vpc.aws_subnet.id
  security_group_id = module.security.security_group_id
}



