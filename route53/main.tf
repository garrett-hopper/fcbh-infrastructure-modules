terraform {
# Live modules pin exact Terraform version; generic modules let consumers pin the version.
# The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
   required_version = "~> 0.12"

# Live modules pin exact provider version; generic modules let consumers pin the version.
   required_providers {
      aws = {
         version = "~> 2.67"
      }
    }
}

#
# Note: the cloudposse module https://github.com/cloudposse/terraform-aws-route53-cluster-zone.git?ref=tags/0.4.0" assumes the current user has 
# permission to update the parent zone, which is not the use case we are developing. Instead, the subdomain zone will be created stand-alone, and 
# the validation records will be manually entered into the parent zone
# module "label" {
#   source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
#   namespace  = var.namespace
#   stage      = var.stage
#   name       = var.name
#   delimiter  = var.delimiter
#   attributes = var.attributes
#   tags       = var.tags
#   enabled    = var.enabled
# }

# data "aws_region" "default" {
# }

# data "template_file" "zone_name" {
#   count    = var.enabled ? 1 : 0
#   template = replace(var.zone_name, "$$", "$")

#   vars = {
#     namespace        = var.namespace
#     name             = var.name
#     stage            = var.stage
#     id               = module.label.id
#     attributes       = join(var.delimiter, module.label.attributes)
#     parent_zone_name = var.parent_zone_name
#     region           = data.aws_region.default.name
#   }
# }
# resource "aws_route53_zone" "default" {
#   count = var.enabled ? 1 : 0
#   name  = join("", data.template_file.zone_name.*.rendered)
#   tags  = module.label.tags
# }


module "route53_zone" {
  source      = "git::https://github.com/cloudposse/terraform-aws-route53-cluster-zone.git?ref=tags/0.11.0"
  namespace   = var.namespace
  stage       = var.stage
  name        = var.name
  attributes  = var.attributes
  tags        = var.tags
  zone_name = var.zone_name
  parent_zone_name = var.parent_zone_name
  parent_zone_record_enabled = var.parent_zone_record_enabled 
}