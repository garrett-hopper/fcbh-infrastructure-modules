# This module can be applied in multiple regions
variable "aws_region" {
  default = "us-east-2"
}

# specify a different AWS profile to provide different access keys
variable "aws_profile" {
  type    = string
  default = "default"
}

#dependencies on Organization
variable "organization_id" {
  type        = string
}

# Organizational Unit
variable "organization_unit_name" {
  type        = string
}