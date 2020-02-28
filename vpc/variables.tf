
# specify a different AWS profile to provide different access keys
variable "aws_profile" {
  type    = string
}

# This module can be applied in multiple regions
variable "aws_region" {
}
# delete above if not needed
#############################

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


variable "cidr_block" {
  type    = string
}
