provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {}
  required_version = ">= 0.12.0"
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

  additional_settings                = var.additional_settings
  vpc_id                             = var.vpc_id
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
  loadbalancer_ssl_policy            = "ELBSecurityPolicy-2016-08"
  loadbalancer_type                  = var.loadbalancer_type
  logs_retention_in_days             = var.logs_retention_in_days
  rolling_update_type                = var.rolling_update_type
  solution_stack_name                = var.solution_stack_name
  keypair                            = var.keypair
}
