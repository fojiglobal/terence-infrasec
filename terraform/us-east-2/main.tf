# This is prod vpc
resource "aws_vpc" "prod" {
  cidr_block = "10.30.0.0/16"
  tags = {
    Name = "prod"
  }
}
