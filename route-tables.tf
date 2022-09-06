resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "publicrt" {
  vpc_id     = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "main-publicrt"
  }
}


resource "aws_route_table" "privatert" {
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "main-privatert"
  }
}

resource "aws_route_table_association" "primary_public_subnet_association" {
  subnet_id      = aws_subnet.primary-public-subnet.id
  route_table_id = aws_route_table.publicrt.id
}

resource "aws_route_table_association" "primary_private_subnet_association" {
  subnet_id      = aws_subnet.primary-private-subnet.id
  route_table_id = aws_route_table.privatert.id
}

resource "aws_route_table_association" "ha_public_subnet_association" {
  subnet_id      = aws_subnet.ha-public-subnet.id
  route_table_id = aws_route_table.publicrt.id
}

resource "aws_route_table_association" "ha_private_subnet_association" {
  subnet_id      = aws_subnet.ha-private-subnet.id
  route_table_id = aws_route_table.privatert.id
}
