# Create a VPC
resource "aws_vpc" "staging" {
  cidr_block = "10.60.0.0/16"
  tags = {
    Name        = "qa-vpc"
    Environment = "qa"
  }
}

