
 ####### vpc module sample1 ########
 resource "aws_vpc" "this" {
cidr_block = var.vpc_cidr
tags = {
  Name = var.env
}
}

### Public Subnet ##########
resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.this.id
  for_each = var.public_subnets
  cidr_block = each.value["cidr"]
  availability_zone = each.value["azs"]
  map_public_ip_on_launch = each.value["enable_public_ip"]
  tags = each.value["tags"]
}
 ##### Private Subnet #########
resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.this.id
  for_each = var.private_subnets
  cidr_block = each.value["cidr"]
  availability_zone = each.value["azs"]
  tags = each.value["tags"]
}