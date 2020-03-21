output "cf_id" {
  value       = module.cloudfront_s3_cdn.cf_id
  description = "The ID of the Cloudfront CDN"
}

output "cf_arn" {
  value       = module.cloudfront_s3_cdn.cf_arn
  description = "The ARN of the Cloudfront CDN"
}

output "cf_domain_name" {
  value       = module.cloudfront_s3_cdn.cf_domain_name
  description = "Domain name corresponding to the distribution"
}

output "cf_hosted_zone_id" {
  value       = module.cloudfront_s3_cdn.cf_hosted_zone_id
  description = "CloudFront Route 53 zone ID"
}

output "s3_bucket" {
  value       = module.cloudfront_s3_cdn.s3_bucket
  description = "Name of S3 bucket"
}

output "s3_bucket_domain_name" {
  value       = module.cloudfront_s3_cdn.s3_bucket_domain_name
  description = "Domain of S3 bucket"
}

output "aliases" {
  value       = module.cloudfront_s3_cdn.aliases
  description = "Aliases of the CloudFront distibution"
}