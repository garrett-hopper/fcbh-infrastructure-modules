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

# the initial terraform configuration will create the resources necessary for the eb command line to create the beanstalk application and enviroment
# the beanstalk configuration will initially deploy into the default VPC

data "aws_security_group" "default" {
  vpc_id = var.vpc_id
  name   = "default"
}

module "elastic_beanstalk_application" {
  source      = "git::https://github.com/cloudposse/terraform-aws-elastic-beanstalk-application.git?ref=tags/0.4.0"
  namespace   = var.namespace
  stage       = var.stage
  name        = var.name
  attributes  = var.attributes
  tags        = var.tags
  description = var.application_description
}

module "elastic_beanstalk_environment" {
  source     = "git::https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment.git?ref=tags/0.18.0"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  attributes = var.attributes
  tags       = var.tags
  region     = var.aws_region

  additional_settings = var.additional_settings
  # application_port = var.application_port # use default
  loadbalancer_subnets               = var.public_subnets
  application_subnets                = var.private_subnets
  allowed_security_groups            = var.allowed_security_groups
  additional_security_groups         = var.additional_security_groups
  description                        = var.environment_description
  dns_zone_id                        = var.dns_zone_id
  elastic_beanstalk_application_name = module.elastic_beanstalk_application.elastic_beanstalk_application_name
  enable_stream_logs                 = var.enable_stream_logs
  env_vars                           = var.env_vars
  environment_type                   = var.environment_type
  healthcheck_url                    = var.healthcheck_url
  instance_type                      = var.instance_type
  loadbalancer_certificate_arn       = var.loadbalancer_certificate_arn
  loadbalancer_type                  = var.loadbalancer_type
  logs_retention_in_days             = var.logs_retention_in_days
  rolling_update_type                = var.rolling_update_type
  solution_stack_name                = var.solution_stack_name
  vpc_id                             = var.vpc_id
  keypair                            = var.keypair
}

# basic elasticache resource creation. The actual cache will be created in beanstalk
resource "aws_elasticache_subnet_group" "dbp-cache" {
  name       = "dbp-elasticache-subnet"
  subnet_ids = var.private_subnets
}

resource "aws_security_group_rule" "allow_cache_access_from_beanstalk" {
  type              = "ingress"
  from_port         = var.elasticache_port
  to_port           = var.elasticache_port
  protocol          = "tcp"
  source_security_group_id = data.aws_security_group.default.id  
  security_group_id = data.aws_security_group.default.id
}

# module "acm_request_certificate" {
#   source                    = "git::https://github.com/cloudposse/terraform-aws-acm-request-certificate.git?ref=master"
#   domain_name               = var.domain_name
#   subject_alternative_names = var.subject_alternative_names
#   tags                      = var.tags
# }


#https://us-west-2.console.aws.amazon.com/codesuite/codecommit/repositories/faithcomesbyhearing-dbp-infrastructure/browse?region=us-west-2
