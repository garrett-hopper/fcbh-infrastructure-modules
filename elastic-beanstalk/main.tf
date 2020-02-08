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

# the initial configuration will create the resources necessary for the eb command line to create the beanstalk application and enviroment
# the beanstalk configuration will initially deploy into the default VPC

# module "acm_request_certificate" {
#   source                    = "git::https://github.com/cloudposse/terraform-aws-acm-request-certificate.git?ref=master"
#   domain_name               = var.domain_name
#   subject_alternative_names = var.subject_alternative_names
#   tags                      = var.tags
# }

module "memcached" {
  source                       = "git::https://github.com/cloudposse/terraform-aws-elasticache-memcached.git?ref=tags/0.3.0"
  namespace                    = var.namespace
  stage                        = var.stage
  name                         = var.name
  availability_zones           = var.availability_zones
  vpc_id                       = var.vpc_id 
  use_existing_security_groups = true
  existing_security_groups     = var.allowed_security_groups
  allowed_security_groups      = var.allowed_security_groups
  subnets                      = var.private_subnets 
  cluster_size                 = var.cluster_size
  instance_type                = var.instance_type
  engine_version               = var.engine_version
  apply_immediately            = true
  zone_id                      = var.zone_id
}


#https://us-west-2.console.aws.amazon.com/codesuite/codecommit/repositories/faithcomesbyhearing-dbp-infrastructure/browse?region=us-west-2
