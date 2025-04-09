# 1. import via CLI using terraform import
# resource "aws_s3_bucket" "remote_state" {
#   bucket = "bucket-to-import-tf"

#   tags = {
#     ManagedBy = "Terraform"
#     Lifecycle = "Critical"
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# 2. import via import block
# import {
#   to = aws_s3_bucket_public_access_block.remote_state
#   id = aws_s3_bucket.remote_state.buc
# }

# resource "aws_s3_bucket_public_access_block" "remote_state" {
#   bucket = aws_s3_bucket.remote_state.bucket

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }