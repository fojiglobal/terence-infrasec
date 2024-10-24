# This is prod vpc
resource "aws_vpc" "prod" {
  cidr_block = "10.30.0.0/16"
  tags = {
    Name = "dev-vpc"
    Envronment = "dev"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}