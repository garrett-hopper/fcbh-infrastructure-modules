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


variable "vpc_id" {
  type        = string
  description = "VPC ID into which to launch the beanstalk environment"
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnet ids"
}
variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnet ids"
}
# module-specific

## this is a useful one. translate all the stuff from the saved_config to here, namespace/name/value
variable "additional_settings" {
  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))
  description = "Additional Elastic Beanstalk settings. For full list of options, see https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html"
  default     = []
}

variable "application_description" {
  type        = string
  description = "Short description of the Elastic Beanstalk Application"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

// availability zones is for memcache
# variable "availability_zones" {
#   type        = list(string)
#   description = "List of availability zones"
# }

variable "dns_zone_id" {
  type        = string
  description = "Route53 parent zone ID. The module will create sub-domain DNS record in the parent zone for the EB environment"
}
variable "enable_stream_logs" {
  #Cloudposse default: false
  type        = bool
  default     = true
  description = "Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment"
}

variable "env_vars" {
  type        = map(string)
  default     = {}
  description = "Map of custom ENV variables to be provided to the application running on Elastic Beanstalk, e.g. env_vars = { DB_USER = 'admin' DB_PASS = 'xxxxxx' }"
}

variable "environment_description" {
  type        = string
  description = "Short description of the Elastic Beanstalk Environment"
}

variable "environment_type" {
  type        = string
  description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `loadbalancer_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments)"
  default     = "LoadBalanced"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Force destroy the S3 bucket for load balancer logs"
}
variable "health_streaming_enabled" {
  #Cloudposse default: false
  type        = bool
  default     = true
  description = "For environments with enhanced health reporting enabled, whether to create a group in CloudWatch Logs for environment health and archive Elastic Beanstalk environment health data. For information about enabling enhanced health, see aws:elasticbeanstalk:healthreporting:system."
}

variable "healthcheck_url" {
  #Cloudposse default: /healthcheck
  type        = string
  description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
  default     = "/"
}

variable "instance_type" {
  type        = string
  description = "Instances type"
}

variable "loadbalancer_type" {
  # cloudposse default is classic
  type        = string
  description = "Load Balancer type, e.g. 'application' or 'classic'"
  default     = "application"
}
variable "loadbalancer_certificate_arn" {
  type        = string
  default     = ""
  description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
}
variable "logs_retention_in_days" {
  #Cloudposse default: 7
  type        = number
  default     = 180
  description = "The number of days to keep log events before they expire."
}
variable "nat_gateway_enabled" {
  # cloudposse default is true  
  type        = bool
  description = "Flag to enable/disable NAT Gateways to allow servers in the private subnets to access the Internet"
  default     = false
}

variable "rolling_update_type" {
  # cloudposse default is Health  
  type        = string
  description = "`Health` or `Immutable`. Set it to `Immutable` to apply the configuration change to a fresh group of instances"
  default     = "Immutable"
}

variable "solution_stack_name" {
  type        = string
  description = "Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. For more info, see https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html"
}
variable "keypair" {
  type        = string
  description = "Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS"
}
variable "allowed_security_groups" {
  type        = list(string)
  description = "List of security groups to add to the EC2 instances"
  default     = []
}
variable "additional_security_groups" {
  type        = list(string)
  description = "List of security groups to be allowed to connect to the EC2 instances"
  default     = []
}

variable "elasticache_port" {
  type        = number
  default     = 11211
  description = "Memcached port"
}

# elasticcache
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




# variable "private_subnets" {
#   type        = list(string)
#   description = "AWS subnet ids"
# }










# variable "port" {
#   type        = number
#   default     = 11211
#   description = "Memcached port"
# }
# variable "elasticache_subnet_group_name" {
#   type        = string
#   description = "Subnet group name for the ElastiCache instance"
#   default     = "elasticache-subnet-group"
# }

# variable "elasticache_parameter_group_family" {
#   type        = string
#   description = "ElastiCache parameter group family"
#   default     = "memcached1.5"
# }

# variable "version_label" {
#   type        = string
#   description = "Elastic Beanstalk Application version to deploy"
# }

# these may come back if Jon wants NetworkOut
# variable "autoscale_measure_name" {
#   type        = string
#   description = "Metric used for your Auto Scaling trigger"
# }

# variable "autoscale_statistic" {
#   type        = string
#   description = "Statistic the trigger should use, such as Average"
# }

# variable "autoscale_unit" {
#   type        = string
#   description = "Unit for the trigger measurement, such as Bytes"
# }

# variable "autoscale_lower_bound" {
#   type        = number
#   description = "Minimum level of autoscale metric to remove an instance"
# }

# variable "autoscale_lower_increment" {
#   type        = number
#   description = "How many Amazon EC2 instances to remove when performing a scaling activity."
# }

# variable "autoscale_upper_bound" {
#   type        = number
#   description = "Maximum level of autoscale metric to add an instance"
# }

# variable "autoscale_upper_increment" {
#   type        = number
#   description = "How many Amazon EC2 instances to add when performing a scaling activity"
# }






#beanstalk

## certificate
# variable "domain_name" {
#   type        = string
#   description = "A domain name for which the certificate should be issued"
# }
# variable "subject_alternative_names" {
#   type        = list(string)
#   default     = []
#   description = "A list of domains that should be SANs in the issued certificate"
# }




