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

# Bring the Security module
module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id
}



