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

# specify a different AWS profile to provide different access keys
variable "aws_profile" {
  type    = string
  default = "bibleis-admin"
}

variable "parent_zone_name" {
  type    = string
}