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

output "cluster_id" {
  value       = module.memcached.cluster_id
  description = "Cluster ID"
}

# output "security_group_id" {
#   value       = join("", aws_security_group.default.*.id)
#   description = "Security Group ID"
# }

# output "cluster_address" {
#   value       = join("", aws_elasticache_cluster.default.*.cluster_address)
#   description = "Cluster address"
# }

# output "cluster_configuration_endpoint" {
#   value       = join("", aws_elasticache_cluster.default.*.configuration_endpoint)
#   description = "Cluster configuration endpoint"
# }

# output "hostname" {
#   value       = module.dns.hostname
#   description = "Cluster hostname"
# }

# output "cluster_urls" {
#   value       = null_resource.cluster_urls.*.triggers.name
#   description = "Cluster URLs"
# }
