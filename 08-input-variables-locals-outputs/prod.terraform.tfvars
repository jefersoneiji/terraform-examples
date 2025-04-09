ec2_instance_type = "t2.micro"
ec2_volume_config = {
  size = 50
  type = "gp3"
}

additional_tags = {
  ValuesFrom = "prod.terraform.tfvars"
}