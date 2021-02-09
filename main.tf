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

# Bring the VPC module
module "vpc" {
  source = "./vpc"
}

# Bring the Sec module
module "sec" {
  source = "./sec"
  vpc_id = module.vpc.vpc_id

}

# Bring the ec2 module
module "ec2" {
  source = "./ec2"
}


