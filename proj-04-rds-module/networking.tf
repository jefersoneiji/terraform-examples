data "aws_vpc" "default" {
  default = true
}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "proj-04-custom"
  }
}

moved {
  from = aws_subnet.allowed
  to   = aws_subnet.private1
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name   = "subnet-custom-vpc-private-1"
    Access = "private"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name   = "subnet-custom-vpc-private-2"
    Access = "private"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet-custom-vpc-public-1"
  }
}

# For documentation. Not actively used
resource "aws_subnet" "not_allowed" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.128.0/24"

  tags = {
    Name = "subnet-default-vpc"
  }
}

# Security Groups

# 1. Source security group - From where traffic is allowed
# 2. Compliant security group
# 3. Non-compliant security group
#   3.1. Security group role

resource "aws_security_group" "source" {
  name        = "source-security-group"
  description = "Security Group from where connections are allowed into the Data Base."
  vpc_id      = aws_vpc.custom.id
}

resource "aws_security_group" "compliant" {
  name        = "compliant-security-group"
  description = "Compliant security group from where connections are allowed into the Data Base."
  vpc_id      = aws_vpc.custom.id
}

resource "aws_vpc_security_group_ingress_rule" "database" {
  security_group_id            = aws_security_group.compliant.id
  referenced_security_group_id = aws_security_group.source.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_security_group" "non_compliant" {
  name        = "non-compliant-security-group"
  description = "Non-compliant security group from where connections are allowed into the Data Base."
  vpc_id      = aws_vpc.custom.id
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.non_compliant.id
  cidr_ipv4         = "0.0.0.0/4"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}