terraform {
  required_version = "1.2.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-bucket-test-terraform-curso"

  tags = {
    Name        = "My bucket Terraform Curso"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.my-test-bucket.id
  acl    = "private"
}
