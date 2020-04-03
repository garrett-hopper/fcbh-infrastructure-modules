variable "aws_region" {
}

variable "aws_profile" {
  type = string
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

variable "db_name" {
  description = "Database name"
  type        = string
}
variable "instance_type" {
  description = "Instance type to use"
  type        = string
  default     = "db.t3.micro"
}
variable "snapshot_identifier" {
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot."
  type        = string
  default     = ""
}
variable "vpc_id" {
  description = "VPC ID to create the cluster in (e.g. `vpc-a22222ee`)"
  type        = string
}
variable "security_groups" {
  description = "List of security groups to be allowed to connect to the DB instance"
  type        = list(string)
  default     = []
}
variable "subnets" {
  type        = list(string)
  description = "List of VPC subnet IDs"
}
variable "zone_id" {
  description = "Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the DB master and replicas"
  type        = string
  default     = ""
}
variable "autoscaling_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable cluster autoscaling"
}

variable "autoscaling_policy_type" {
  type        = string
  default     = "TargetTrackingScaling"
  description = "Autoscaling policy type. `TargetTrackingScaling` and `StepScaling` are supported"
}

variable "autoscaling_target_metrics" {
  type        = string
  default     = "RDSReaderAverageCPUUtilization"
  description = "The metrics type to use. If this value isn't provided the default is CPU utilization. RDSReaderAverageDatabaseConnections"
}

variable "autoscaling_target_value" {
  type        = number
  default     = 75
  description = "The target value to scale with respect to target metrics"
}
variable "autoscaling_min_capacity" {
  type        = number
  default     = 1
  description = "Minimum number of instances to be maintained by the autoscaler"
}
