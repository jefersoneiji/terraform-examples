locals {
  vpc_cidr             = "10.0.0.0/16"
  private_subnet_cidrs = ["10.0.0.0/24"]
  public_subnet_cidrs  = ["10.0.128.0/24"]
}

data "aws_availability_zones" "azs" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  cidr            = local.vpc_cidr
  private_subnets = local.private_subnet_cidrs
  public_subnets  = local.public_subnet_cidrs
  azs             = data.aws_availability_zones.azs.names
  name            = local.project_name

  tags = local.common_tags
}