output "endpoint" {
  value       = module.rds_cluster_aurora_mysql.endpoint
  description = "The DNS address of the RDS instance"
}