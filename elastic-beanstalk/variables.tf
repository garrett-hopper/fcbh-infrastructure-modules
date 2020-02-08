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


# elasticcache
variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC ID"
}

variable "private_subnets" {
  type        = list(string)
  description = "AWS subnet ids"
}
variable "cluster_size" {
  type        = number
  default     = 1
  description = "Cluster size"
}

variable "instance_type" {
  type        = string
  default     = "cache.t2.small"
  description = "Elastic cache instance type"
}

variable "engine_version" {
  type        = string
  default     = "1.5.16"
  description = "Memcached engine version. For more info, see https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/supported-engine-versions.html"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones for the cluster"
}

variable "zone_id" {
  type        = string
  default     = ""
  description = "Route53 DNS Zone ID"
}

variable "port" {
  type        = number
  default     = 11211
  description = "Memcached port"
}
variable "elasticache_subnet_group_name" {
  type        = string
  description = "Subnet group name for the ElastiCache instance"
  default     = "elasticache-subnet-group"
}

variable "elasticache_parameter_group_family" {
  type        = string
  description = "ElastiCache parameter group family"
  default     = "memcached1.5"
}

variable "allowed_security_groups" {
  type        = list(string)
  default     = []
  description = "List of Security Group IDs that are allowed ingress to the cluster's Security Group created in the module"
}