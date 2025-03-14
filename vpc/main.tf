terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
resource "aws_vpc" "vpc" {
  # count = 0
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "${var.environment}-vpc"
  }
}

resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_vpc.vpc.id
  # count = 0
  ingress {
    protocol = -1
    self = true
    from_port = 0
    to_port = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "${var.environment}-default-sg"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  # count = 0
  tags = {
    "Name" = "${var.environment}-igw"
  }
}

resource "aws_egress_only_internet_gateway" "e_igw" {
  vpc_id = aws_vpc.vpc.id
  # count = 0
  tags = {
    "Name" = "${var.environment}-e-igw"
  }
}

resource "aws_eip" "nat_epi" {
  # count = 0
  tags = {
    "Name" = "${var.environment}-epi"
  }
}

resource "aws_nat_gateway" "ngw" {
  # count = 0
  allocation_id = aws_eip.nat_epi.id
  subnet_id = aws_subnet.public[0].id
  tags = {
    "Name" = "${var.environment}-Natgateway"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  # count = 0
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    "Name" = "${var.environment}-Private-Route-table"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  # count = 0
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "${var.environment}-Public-Route-table"
  }
}