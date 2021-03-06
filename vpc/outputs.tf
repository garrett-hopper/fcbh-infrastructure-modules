output "vpc_id" { 
  value = module.vpc.vpc_id
}
output "cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "vpc_default_security_group_id" {
  value       = module.vpc.vpc_default_security_group_id
  description = "The ID of the security group created by default on VPC creation"
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  value       = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets"
  value       = module.subnets.private_subnet_ids
}
output "bastion_subnet_id" {
  description = "Subnet Id containing the bastion host"
  value       = module.subnets.public_subnet_ids[0]
}
output "availability_zones" {
  description = "List of Availability Zones where subnets were created"
  value       = module.subnets.availability_zones
}
