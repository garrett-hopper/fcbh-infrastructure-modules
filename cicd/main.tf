provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {}
  required_version = ">= 0.12.0"
}

module "cicd" {
  source                             = "git::https://github.com/cloudposse/terraform-aws-cicd.git?ref=tags/0.8.0"
  namespace                          = var.namespace
  stage                              = var.stage
  name                               = var.name
  github_oauth_token                 = var.github_oauth_token
  repo_owner                         = var.repo_owner
  repo_name                          = var.repo_name
  branch                             = var.branch
  elastic_beanstalk_application_name = var.elastic_beanstalk_application_name
  elastic_beanstalk_environment_name = var.elastic_beanstalk_environment_name
}
