terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "some-random-bucket-name-abcd"
}

resource "aws_s3_bucket" "us-east" {
  bucket   = "some-random-bucket-name-efgh"
  provider = aws.us-east
}
