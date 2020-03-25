# This module can be applied in multiple regions
variable "aws_region" {
}

# specify a different AWS profile to provide different access keys
variable "aws_profile" {
  type = string
}

variable "domain_name" {
  type        = string
  description = "A domain name for which the certificate should be issued"
}
variable "subject_alternative_names" {
  type        = list(string)
  default     = []
  description = "A list of domains that should be SANs in the issued certificate"
}
variable "validation_method" {
  type        = string
  default     = "DNS"
  description = "Method to use for validation, DNS or EMAIL"
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map('BusinessUnit`,`XYZ`)"
}
