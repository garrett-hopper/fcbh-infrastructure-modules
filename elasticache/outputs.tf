output "cluster_configuration_endpoint" {
  value       = module.memcached.cluster_configuration_endpoint
  description = "Cluster configuration endpoint"
}
output "cluster_address" {
  value       = module.memcached.cluster_address
  description = "Cluster address"
}