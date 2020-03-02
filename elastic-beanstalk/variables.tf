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

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "application_description" {
  type        = string
  description = "Short description of the Elastic Beanstalk Application"
}
variable "additional_settings" {
  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))
  description = "Additional Elastic Beanstalk settings. For full list of options, see https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html"
  default     = []
}
variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnet ids"
}
variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnet ids"
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
variable "environment_description" {
  type        = string
  description = "Short description of the Elastic Beanstalk Environment"
}
variable "dns_zone_id" {
  type        = string
  description = "Route53 parent zone ID. The module will create sub-domain DNS record in the parent zone for the EB environment"
}
variable "enable_stream_logs" {
  type        = bool
  default     = false
  description = "Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment"
}
variable "env_vars" {
  type        = map(string)
  default     = {}
  description = "Map of custom ENV variables to be provided to the application running on Elastic Beanstalk, e.g. env_vars = { DB_USER = 'admin' DB_PASS = 'xxxxxx' }"
}
variable "environment_type" {
  type        = string
  description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `loadbalancer_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments)"
  default     = "LoadBalanced"
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
variable "loadbalancer_certificate_arn" {
  type        = string
  default     = ""
  description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
}
variable "loadbalancer_type" {
  # cloudposse default is classic
  type        = string
  description = "Load Balancer type, e.g. 'application' or 'classic'"
  default     = "application"
}
variable "logs_retention_in_days" {
  #Cloudposse default: 7
  type        = number
  default     = 180
  description = "The number of days to keep log events before they expire."
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
variable "vpc_id" {
  type        = string
  description = "VPC ID into which to launch the beanstalk environment"
}
variable "keypair" {
  type        = string
  description = "Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS"
  default     = ""
}