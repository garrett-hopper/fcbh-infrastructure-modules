
provider "aws" {
  region = var.aws_region
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}

  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

# 2. Create organization unit for production. Creating separate Org Units for Prod and Non-Prod allows for more appropriate Policy Management
resource "aws_organizations_organizational_unit" "org_unit" {
  name      = var.organization_unit_name
  parent_id = var.organization_id
}

# 3. create organization member account
# setting iam_user_access_to_billing = "ALLOW" will enable IAM users in the new account to view account billing information if they have the required permissions. 
# This can be useful if subaccount is contracted out, and the contractor is accountable for maintaining a budget
# https://www.terraform.io/docs/providers/aws/r/organizations_account.html
# resource "aws_organizations_account" "production" {
#   name                       = var.member_account_name
#   email                      = var.member_account_email
#   parent_id                  = aws_organizations_organizational_unit.org_unit.id
#   role_name                  = "AdminRoleFromOrg"
#   iam_user_access_to_billing = "ALLOW"

#   # There is no AWS Organizations API for reading role_name
#   lifecycle {
#     ignore_changes = ["role_name"]
#   }
# }

#TODO: uncomment when https://github.com/cloudposse/terraform-aws-organization-access-group/pull/16 is merged
# module "organization_access_group" {
#   source      = "git::https://github.com/techfishio/terraform-aws-organization-access-group.git?ref=tags/0.6.0"
#   namespace   = var.namespace
#   stage       = var.stage
#   name        = "org-access-to-prod"
#   user_names  = var.iam_users_accessing_member_account
#   role_arns   = map("key", format("arn:aws:iam::%d:role/OrganizationAccountAccessRole", var.member_account_id))
#   require_mfa = "true"
# }

# If the organization invites an existing account, one bit of configuration is needed in the invited account
# This module creates OrganizationAccountAccessRole role in an invited member account.
#Note: this role is to be created in the INVITED account, not the org or master account
#TODO figure out how to execute this the member account. need to set a different account context
# module "organization_access_role" {
#   source            = "git::https://github.com/cloudposse/terraform-aws-organization-access-role.git?ref=master"
#   master_account_id = var.organization_master_account_id
#   role_name         = "OrganizationAccountAccessRole"
#   policy_arn        = "arn:aws:iam::aws:policy/AdministratorAccess"
# }
