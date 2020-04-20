terraform {
# Live modules pin exact Terraform version; generic modules let consumers pin the version.
# The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
   required_version = "= 0.12.24"

# Live modules pin exact provider version; generic modules let consumers pin the version.
   required_providers {
      aws = {
         version = "= 2.58.0"
      }
    }
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
