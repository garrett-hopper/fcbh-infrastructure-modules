# Boilerplate to ensure uniformity
variable "namespace" {
  description = "Namespace (e.g. `fcbh` )"
  type        = string
  default     = ""
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name  (e.g. `app` or `cluster`)"
  type        = string
}

# This module can be applied in multiple regions
variable "aws_region" {
  default = "us-east-2"
}

#dependencies on Organization
variable "organization_id" {
  type        = string
}
variable "organization_master_account_id" {
  type        = string
}

# Organizational Unit
variable "organization_unit_name" {
  type        = string
}

# Configuration of Production account
# The Production account will contain resources which deliver the mission capability. Access to this account is 
# limited to accountable users.  
# The Production account can either be created new or already existing. In either case, the account will be attached
# to the Organizational Unit "Operations", which in turn is associated with Organization "DBP"

# email to associate with created member account
variable "member_account_name" {
  description = "Member Account Name"
  type = string
}
# email to associate with created member account
variable "member_account_email" {
  description = "Email to associate with created member account"
  type = string
}
# Specified users in the master account are granted Administrative access to each member account
# example:
# IAM user "bwflood" must exist in the master account
# iam_users_accessing_member_account = ["bwflood"]
variable "iam_users_accessing_member_account" {
  description = "IAM user that will be granted access to switchrole to member account"
  type = "list"
}

# to establish linkage between the master account and the member account, an IAM role is created in the master account
# IAM users specified above are assigned to this role

#example: 
#role_arn_referencing_member_account = {"dbp@prod" = "arn:aws:iam::627672411722:role/OrganizationAccountAccessRole"}
variable "role_arn_referencing_member_account" {
  description = "Role ARN that will attach to Group in Master Account which has switchrole access to member account"
  type        = "map"
}