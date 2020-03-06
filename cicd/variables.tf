# AWS 
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type    = string
}
# administrative, to match cloudposse label
variable "namespace" {
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  type        = string
}

variable "stage" {
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
  type        = string
}

variable "name" {
  description = "Solution name, e.g. 'app' or 'cluster'"
  type        = string
}

variable "elastic_beanstalk_application_name" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk application name. If not provided or set to empty string, the ``Deploy`` stage of the pipeline will not be created"
}

variable "elastic_beanstalk_environment_name" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk environment name. If not provided or set to empty string, the ``Deploy`` stage of the pipeline will not be created"
}
variable "github_oauth_token" {
  type        = string
  default     = ""  
  description = "(Optional) Environment Variable containing GitHub Oauth Token for access to private repo"
}
variable "repo_owner" {
  type        = string
  description = "GitHub Organization or Person name"
}

variable "repo_name" {
  type        = string
  description = "GitHub repository name of the application to be built (and deployed to Elastic Beanstalk if configured)"
}

variable "branch" {
  type        = string
  description = "Branch of the GitHub repository, _e.g._ `master`"
}

variable "buildspec" {
  type        = string
  default     = ""
  description = " Declaration to use for building the project. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html)"
}


###
variable "enabled" {
  type        = bool
  default     = true
  description = "A boolean to enable/disable resource creation"
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit', 'XYZ')`"
}
variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `policy` or `role`)"
}
variable "force_destroy" {
  type        = bool
  default     = false
  description = "Force destroy the CI/CD S3 bucket even if it's not empty"
}
variable "poll_source_changes" {
  type        = bool
  default     = true
  description = "Periodically check the location of your source content and run the pipeline if changes are detected"
}