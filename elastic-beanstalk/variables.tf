# AWS 
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type    = string
  default = "dbp-admin"
}

# administrative, to match cloudposse label
variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'cluster'"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}


# module-specific, sorted alphabetically 
## certificate
variable "domain_name" {
  type        = string
  description = "A domain name for which the certificate should be issued"
}
variable "subject_alternative_names" {
  type        = list(string)
  default     = []
  description = "A list of domains that should be SANs in the issued certificate"
}
