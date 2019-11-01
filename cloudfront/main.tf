provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}

  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

module "cloudfront_s3_cdn" {
  source          = "git::https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn.git?ref=master"
  namespace                = var.namespace
  stage                    = var.stage
  name                     = var.name
  parent_zone_name         = var.parent_zone_name
  use_regional_s3_endpoint = true
  origin_force_destroy     = true
  cors_allowed_headers     = ["*"]
  cors_allowed_methods     = ["GET", "HEAD"]
  cors_allowed_origins     = ["*.fcbh.org"]
  cors_expose_headers      = ["ETag"]
}

resource "aws_s3_bucket_object" "index" {
  bucket       = module.cloudfront_s3_cdn.s3_bucket
  key          = "index.html"
  source       = "${path.module}/index.html"
  content_type = "text/html"
  etag         = md5(file("${path.module}/index.html"))
}