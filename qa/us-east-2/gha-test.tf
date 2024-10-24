# This is prod vpc
resource "aws_vpc" "prod" {
  cidr_block = "10.30.0.0/16"
  tags = {
    Name       = "qa-vpc"
    Envronment = "qa"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terry-cs2-terraform"
    key            = "qa/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "cs2-infrasec-terraform"
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}
