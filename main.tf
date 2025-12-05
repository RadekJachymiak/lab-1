terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.25.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "my-bucket" {
  bucket_prefix = "awsninja-3"
}

resource "aws_s3_object" "Object" {
  for_each = fileset(path.module,"messages/*")
  bucket = aws_s3_bucket.my-bucket.bucket
  key = basename(each.key)
  source = each.key
}