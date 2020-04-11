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

module "notify_slack" {
  source            = "git::https://github.com/cloudposse/terraform-aws-sns-lambda-notify-slack?ref=tags/0.3.0"
  namespace         = var.namespace
  stage             = var.stage
  name              = var.name
  sns_topic_name    = var.sns_topic_name
  slack_webhook_url = var.slack_webhook_url
  slack_channel     = var.slack_channel
  slack_username    = var.slack_username
}
