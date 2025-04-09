variable "terraform_cloud_hostname" {
  default     = "app.terraform.io"
  type        = string
  description = "Terraform cloud hostname, without https://"
}

variable "terraform_cloud_audience" {
  default     = "aws.workload.identity"
  type        = string
  description = "Terraform cloud audience used to authenticate in AWS."
}