terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_vpc" "udemy_terraform_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "udemy_terraform_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.udemy_terraform_vpc.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.udemy_terraform_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_internet_gateway" "udemy_terraform_gateway" {
  vpc_id = aws_vpc.udemy_terraform_vpc.id
}

resource "aws_route_table" "udemy_terraform_route_table" {
  vpc_id = aws_vpc.udemy_terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.udemy_terraform_gateway.id
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.udemy_terraform_route_table.id
}