############## Public Routetable ##########################
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.staging.id
  }

  tags = {
    Name = "Public_Routetable"
  }
}

################## Routetable Associations ##########################

resource "aws_route_table_association" "pub_sub_1" {
  subnet_id      = aws_subnet.staging_publ_1.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_sub_2" {
  subnet_id      = aws_subnet.staging_publ_2.id
  route_table_id = aws_route_table.pub_rt.id
}

############## Private Routetable ##########################
resource "aws_route_table" "priv_rt" {
  vpc_id = aws_vpc.staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.staging.id
  }

  tags = {
    Name = "Private_Routetable"
  }
}

################## Routetable Associations ##########################

resource "aws_route_table_association" "priv_sub_1" {
  subnet_id      = aws_subnet.staging_priv_1.id
  route_table_id = aws_route_table.priv_rt.id
}

resource "aws_route_table_association" "priv_sub_2" {
  subnet_id      = aws_subnet.staging_priv_2.id
  route_table_id = aws_route_table.priv_rt.id
}

