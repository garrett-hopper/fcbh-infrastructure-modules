# output "certificate_id" {
#   value       = module.acm_request_certificate.id
#   description = "The ID of the certificate"
# }

# output "certificate_arn" {
#   value       = module.acm_request_certificate.arn
#   description = "The ARN of the certificate"
# }

# output "certificate_domain_validation_options" {
#   value       = module.acm_request_certificate.domain_validation_options
#   description = "CNAME records that are added to the DNS zone to complete certificate validation"
# }



# output "launch_configuration_security_group" {
#   value       = data.aws_security_group.default.id
#   description = "Launch Configuration Security Group ID"
# }

# beanstalk outputs
output "elastic_beanstalk_application_name" {
  value       = module.elastic_beanstalk_application.elastic_beanstalk_application_name
  description = "Elastic Beanstalk Application name"
}

output "elastic_beanstalk_environment_hostname" {
  value       = module.elastic_beanstalk_environment.hostname
  description = "DNS hostname"
}

output "elastic_beanstalk_environment_id" {
  description = "ID of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk_environment.id
}

output "elastic_beanstalk_environment_name" {
  value       = module.elastic_beanstalk_environment.name
  description = "Name"
}
output "elastic_beanstalk_environment_application" {
  description = "The Elastic Beanstalk Application specified for this environment"
  value       = module.elastic_beanstalk_environment.application
}

output "elastic_beanstalk_environment_setting" {
  description = "Settings specifically set for this environment"
  value       = module.elastic_beanstalk_environment.setting
}

output "elastic_beanstalk_environment_all_settings" {
  description = "List of all option settings configured in the environment. These are a combination of default settings and their overrides from setting in the configuration"
  value       = module.elastic_beanstalk_environment.all_settings
}

output "elastic_beanstalk_environment_endpoint" {
  description = "Fully qualified DNS name for the environment"
  value       = module.elastic_beanstalk_environment.endpoint
}

output "elastic_beanstalk_environment_autoscaling_groups" {
  description = "The autoscaling groups used by this environment"
  value       = module.elastic_beanstalk_environment.autoscaling_groups
}

output "elastic_beanstalk_environment_instances" {
  description = "Instances used by this environment"
  value       = module.elastic_beanstalk_environment.instances
}

output "elastic_beanstalk_environment_launch_configurations" {
  description = "Launch configurations in use by this environment"
  value       = module.elastic_beanstalk_environment.launch_configurations
}

output "elastic_beanstalk_environment_load_balancers" {
  description = "Elastic Load Balancers in use by this environment"
  value       = module.elastic_beanstalk_environment.load_balancers
}

output "elastic_beanstalk_environment_triggers" {
  description = "Autoscaling triggers in use by this environment"
  value       = module.elastic_beanstalk_environment.triggers
}



# output "security_group_id" {
#   value       = join("", aws_security_group.default.*.id)
#   description = "Security Group ID"
# }





# output "hostname" {
#   value       = module.dns.hostname
#   description = "Cluster hostname"
# }

# output "cluster_urls" {
#   value       = null_resource.cluster_urls.*.triggers.name
#   description = "Cluster URLs"
# }