# Create a VPC
resource "aws_vpc" "staging" {
 cidr_block = var.staging_vpc_cidr
 tags = {
   Name = "staging"
   Environment = "staging"
 }
}


