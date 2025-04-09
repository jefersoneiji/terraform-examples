locals {
  allowed_instance_types = ["t2.micro", "t3.micro"]
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

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.this[0].id

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  tags = {
    CostCenter = "1234"
  }

  lifecycle {
    create_before_destroy = true
    postcondition {
      condition     = contains(local.allowed_instance_types, self.instance_type)
      error_message = "Self invalid instance type."
    }
  }
}

check "cost_center_check" {
  assert {
    condition     = can(aws_instance.web.tags.CostCenter != "")
    error_message = "Your AWS Instance does not have a CostCenter tag."
  }
}