# AWS 
# variable "aws_region" {
#   type        = string
#   description = "AWS region"
# }

# variable "aws_profile" {
#   type    = string
#   default = "dbp-admin"
# }

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



variable "elasticache_port" {
  type        = number
  default     = 11211
  description = "Memcached port"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones for the cluster"
}
variable "cluster_size" {
  type        = number
  default     = 1
  description = "Cluster size"
}
variable "engine_version" {
  type        = string
  default     = "1.5.16"
  description = "Memcached engine version. For more info, see https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/supported-engine-versions.html"
}
variable "zone_id" {
  type        = string
  default     = ""
  description = "Route53 DNS Zone ID"
}
variable "use_existing_security_groups" {
  type        = bool
  description = "Flag to enable/disable creation of Security Group in the module. Set to `true` to disable Security Group creation and provide a list of existing security Group IDs in `existing_security_groups` to place the cluster into"
  default     = false
}

variable "existing_security_groups" {
  type        = list(string)
  default     = []
  description = "List of existing Security Group IDs to place the cluster into. Set `use_existing_security_groups` to `true` to enable using `existing_security_groups` as Security Groups for the cluster"
}

variable "memcached_instance_type" {
  type        = string
  default     = "cache.t3.small"
  description = "Elastic cache instance type"
}