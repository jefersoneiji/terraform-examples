locals {
  ec2_names = ["instance1", "instance2"]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# resource "aws_instance" "new" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.main.id
# }

# module "compute" {
#   source = "./modules/compute"
#   subnet_id = aws_subnet.main.id
# }

# resource "aws_subnet" "main" {
#   vpc_id            = aws_vpc.main.id
#   availability_zone = "sa-east-1a"
#   cidr_block        = "10.0.0.0/24"

#   tags = {
#     Project = "16-state-manipulation"
#     Name    = "16-state-manipulation"
#   }
# }

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Project = "16-state-manipulation"
#     Name    = "16-state-manipulation"
#   }
# }

# moved {
#   from = aws_instance.new
#   to = module.compute.aws_instance.this
# }