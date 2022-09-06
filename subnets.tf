resource "aws_subnet" "primary-public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.primary_public_cidr_block
  availability_zone = var.zonea
  
  tags = {
    Name = "main-primary-public-subnet"
  }
}

resource "aws_subnet" "primary-private-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.primary_private_cidr_block
  availability_zone = var.zonea
  
  tags = {
    Name = "main-primary-private-subnet"
  }
}

resource "aws_subnet" "ha-public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.ha_public_cidr_block
  availability_zone = var.zoneb
  
  tags = {
    Name = "main-ha-public-subnet"
  }
}

resource "aws_subnet" "ha-private-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.ha_private_cidr_block
  availability_zone = var.zoneb
  
  tags = {
    Name = "main-ha-private-subnet"
  }
}
