provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {}
  required_version = ">= 0.12.0"
}

data "aws_availability_zones" "all" {
  state = "available"
}


module "memcached" {
  source                       = "git::https://github.com/cloudposse/terraform-aws-elasticache-memcached.git?ref=tags/0.3.0"
  namespace                    = var.namespace
  stage                        = var.stage
  name                         = "cache"
  availability_zones           = data.aws_availability_zones.all.names
  vpc_id                       = var.vpc_id
  allowed_security_groups      = [module.elastic_beanstalk_environment.security_group_id]
  subnets                      = var.private_subnets
  cluster_size                 = var.cluster_size
  instance_type                = var.memcached_instance_type
  engine_version               = var.engine_version
  apply_immediately            = true
  zone_id                      = var.zone_id
}

# module "acm_request_certificate" {
#   source                    = "git::https://github.com/cloudposse/terraform-aws-acm-request-certificate.git?ref=master"
#   domain_name               = var.domain_name
#   subject_alternative_names = var.subject_alternative_names
#   tags                      = var.tags
# }


#https://us-west-2.console.aws.amazon.com/codesuite/codecommit/repositories/faithcomesbyhearing-dbp-infrastructure/browse?region=us-west-2
