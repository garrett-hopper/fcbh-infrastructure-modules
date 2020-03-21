variable "aws_region" {
  default = "us-east-2-foo"
}

# specify a different AWS profile to provide different access keys
variable "aws_profile" {
  type    = string
}

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



variable "parent_zone_id" {
  type        = string
  default     = ""
  description = "ID of the hosted zone to contain this record  (or specify `parent_zone_name`)"
}

variable "aliases" {
  type        = list(string)
  description = "List of FQDN's - Used to set the Alternate Domain Names (CNAMEs) setting on Cloudfront"
  default     = []
}

variable "log_prefix" {
  type        = string
  default     = ""
  description = "Path of logs in S3 bucket"
}

variable "acm_certificate_arn" {
  type        = string
  description = "Existing ACM Certificate ARN"
  default     = ""
}
variable "minimum_protocol_version" {
  type        = string
  description = "Cloudfront TLS minimum protocol version"
  default     = "TLSv1"
}
variable "cors_allowed_origins" {
  type        = list(string)
  default     = []
  description = "List of allowed origins (e.g. example.com, test.com) for S3 bucket"
}
variable "ordered_cache" {
  type = list(object({
    path_pattern = string

    allowed_methods = list(string)
    cached_methods  = list(string)
    compress        = bool

    viewer_protocol_policy = string
    min_ttl                = number
    default_ttl            = number
    max_ttl                = number

    forward_query_string  = bool
    forward_header_values = list(string)
    forward_cookies       = string

    lambda_function_association = list(object({
      event_type   = string
      include_body = bool
      lambda_arn   = string
    }))
  }))
  default     = []
  description = <<DESCRIPTION
An ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0.
The fields can be described by the other variables in this file. For example, the field 'lambda_function_association' in this object has
a description in var.lambda_function_association variable earlier in this file. The only difference is that fields on this object are in ordered caches, whereas the rest
of the vars in this file apply only to the default cache.
DESCRIPTION
}