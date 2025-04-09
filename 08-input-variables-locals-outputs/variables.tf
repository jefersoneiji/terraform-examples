variable "aws_region" {
  type    = string
  default = "sa-east-1"
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The size of managed EC2 instances."

  validation {
    condition     = contains(["t2.micro"], var.ec2_instance_type)
    error_message = "Only supports t2.micro ."
  }
}

variable "ec2_volume_type" {
  type        = string
  default     = "gp3"
  description = "Volume type between gp2 and gp3."

  validation {
    condition     = contains(["gp3"], var.ec2_volume_type)
    error_message = "Only supports gp3 ."
  }
}

variable "ec2_volume_size" {
  type        = number
  default     = 10
  description = "Size in GB of the root block volume attached to managed EC2 instances."

  validation {
    condition     = contains([10], var.ec2_volume_size)
    error_message = "Only supports 10 ."
  }
}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })

  description = "The size and type of the root block volume for EC2 instances."

  default = {
    size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "my_sensitive_value" {
  type      = string
  sensitive = true
}