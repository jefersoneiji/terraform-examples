resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# terraform apply -var-file="$(terraform workspace show).tfvars"
resource "aws_s3_bucket" "this" {
    count = var.bucket_count
  bucket = "workspaces-demos-${terraform.workspace}-${random_id.bucket_suffix.hex}"
}