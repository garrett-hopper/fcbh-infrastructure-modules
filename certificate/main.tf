terraform {
# Live modules pin exact Terraform version; generic modules let consumers pin the version.
# The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
   required_version = "~> 0.12"

# Live modules pin exact provider version; generic modules let consumers pin the version.
   required_providers {
      aws = {
         version = "~> 2.70"
      }
    }
}


module "acm_request_certificate" {
  source                    = "git::https://github.com/cloudposse/terraform-aws-acm-request-certificate.git?ref=tags/0.10.0" 
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  tags                      = var.tags
}
