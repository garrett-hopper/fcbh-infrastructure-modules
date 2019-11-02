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
  source    = "git::https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn.git?ref=master"
  namespace = var.namespace
  stage     = var.stage
  name      = var.name

  acm_certificate_arn      = var.acm_certificate_arn
  aliases                  = var.aliases
  allowed_methods          = ["GET", "HEAD", "OPTIONS"]
  cached_methods           = ["GET", "HEAD", "OPTIONS"]
  compress                 = true
  cors_allowed_headers     = ["Authorization"]
  cors_allowed_methods     = ["GET"]
  cors_allowed_origins     = ["*.fcbh.org","content.cdn.dbp-prod.dbp4.org"]
  cors_expose_headers      = ["ETag"]
  default_ttl              = 86400
  parent_zone_id           = var.parent_zone_id
  log_prefix               = var.log_prefix
  minimum_protocol_version = var.minimum_protocol_version
  origin_force_destroy     = false
  price_class              = "PriceClass_All"
  trusted_signers          = ["self"]
  use_regional_s3_endpoint = true
  viewer_protocol_policy   = "allow-all"
}

resource "aws_s3_bucket_object" "index" {
  bucket       = module.cloudfront_s3_cdn.s3_bucket
  key          = "index.html"
  source       = "${path.module}/index.html"
  content_type = "text/html"
  etag         = md5(file("${path.module}/index.html"))
}