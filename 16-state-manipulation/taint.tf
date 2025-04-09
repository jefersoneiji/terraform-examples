resource "aws_s3_bucket" "tainted" {
 bucket = "tainted-bucket-123456" 
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet"  "this" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_s3_bucket_public_access_block" "from_tainted" {
  bucket = aws_s3_bucket.tainted.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true
}