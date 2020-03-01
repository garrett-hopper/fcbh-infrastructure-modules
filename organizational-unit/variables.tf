# This module can be applied in multiple regions
variable "aws_region" {
}

variable "aws_profile" {
  type    = string
}

#dependencies on Organization
variable "organization_id" {
  type        = string
}

# Organizational Unit
variable "organization_unit_name" {
  type        = string
}