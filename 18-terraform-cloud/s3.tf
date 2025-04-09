resource "aws_s3_bucket" "terraform_cloud" {
  bucket = "terraform-cloud-${random_id.this.hex}"

  tags = {
    CreatedBy = "Terraform Cloud"
  }
}