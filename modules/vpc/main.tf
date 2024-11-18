resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true


  tags = {
    Name = "secure-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "secure-vpc-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  cidr_block = each.value
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-${each.key}"
  }
}
resource "aws_subnet" "private" {
  for_each = var.private_subnets

  cidr_block = each.value
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "PrivateSubnet-${each.key}"
  }
}

resource "aws_route_table_association" "public_association" {
  for_each = var.public_subnets

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "dashboard_sg" {
  name        = "dashboard-sg-new" # Use a unique name
  description = "Allow HTTP and SSH traffic"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Dashboard-Security-Group"
  }
}

