variable "subnet_count" {
  type    = number
  default = 0
  # default = 2
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
  }))

  # Ensure that all provided CIDR blocks are valid. 
  validation {
    condition     = alltrue([for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))])
    error_message = "At least one of the provided CIDR block is not valid."
  }
}

variable "ec2_instance_count" {
  type = number
}

variable "ec2_instance_config_list" {
  type = list(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))

  # Ensure that only t2.micro is used.
  validation {
    condition     = alltrue([for config in var.ec2_instance_config_list : contains(["t2.micro"], config.instance_type)])
    error_message = "Only t2.micro instances are allowed."
  }

  # Ensure that only ubuntu and nginx images are used.
  validation {
    condition     = alltrue([for config in var.ec2_instance_config_list : contains(["ubuntu", "nginx"], config.ami)])
    error_message = "Only ubuntu and nginx amis are allowed."
  }
}

variable "ec2_instance_config_map" {
  type = map(object({
    instance_type = string
    ami           = string
    # subnet_index  = optional(number, 0)
    subnet_name = optional(string, "default")
  }))

  # Ensure that only t2.micro is used.
  validation {
    condition     = alltrue([for config in values(var.ec2_instance_config_map) : contains(["t2.micro"], config.instance_type)])
    error_message = "Only t2.micro instances are allowed."
  }

  # Ensure that only ubuntu and nginx images are used.
  validation {
    condition     = alltrue([for key, config in var.ec2_instance_config_map : contains(["ubuntu", "nginx"], config.ami)])
    error_message = "Only ubuntu and nginx amis are allowed."
  }
}