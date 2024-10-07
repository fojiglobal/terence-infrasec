############################# Public subnets ###################################
resource "aws_subnet" "staging_publ_1" {
  vpc_id                  = aws_vpc.staging.id
  cidr_block              = "10.10.20.0/24"
  availability_zone       = var.us-east-2a
  map_public_ip_on_launch = true
  tags = {
    Name = "staging_pub_1"
  }
}

resource "aws_subnet" "staging_publ_2" {
  vpc_id                  = aws_vpc.staging.id
  cidr_block              = "10.10.30.0/24"
  availability_zone       = var.us-east-2b
  map_public_ip_on_launch = true
  tags = {
    Name = "staging_pub_2"
  }
}

############################# Private subnets ###################################
resource "aws_subnet" "staging_priv_1" {
  vpc_id            = aws_vpc.staging.id
  cidr_block        = "10.10.40.0/24"
  availability_zone = var.us-east-2a
  tags = {
    Name = "staging_priv_1"
  }
}

resource "aws_subnet" "staging_priv_2" {
  vpc_id            = aws_vpc.staging.id
  cidr_block        = "10.10.50.0/24"
  availability_zone = var.us-east-2b
  tags = {
    Name = "staging_priv_2"
  }
}