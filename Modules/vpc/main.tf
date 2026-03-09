resource "aws_vpc" "this" {
  cidr_block           = var.VPC-CIDR
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = "CUI Enclave" }
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id
}

resource "aws_subnet" "public" { 
    vpc_id = aws_vpc.this.id
    cidr_block = var.public_subnet_cidr
    map_public_ip_on_launch = true # GIVE PUBLIC IP TO ANY INSTANCE IN THIS SUBNET 
    tags = {
        Name = "public-subnet"
    }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.private_subnet_cidr
    tags = {
        Name = "private subnet"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.this.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.this.id
    }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
