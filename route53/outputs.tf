# output "parent_zone_id" {
#   value       = join("", null_resource.parent.*.triggers.zone_id)
#   description = "ID of the hosted zone to contain this record"
# }

# output "parent_zone_name" {
#   value       = join("", null_resource.parent.*.triggers.zone_name)
#   description = "Name of the hosted zone to contain this record"
# }

# output "zone_id" {
#   value       = join("", aws_route53_zone.default.*.zone_id)
#   description = "Route53 DNS Zone ID"
# }

# output "zone_name" {
#   value       = replace(join("", aws_route53_zone.default.*.name), "/\\.$/", "")
#   description = "Route53 DNS Zone name"
# }

# output "fqdn" {
#   value       = join("", aws_route53_zone.default.*.name)
#   description = "Fully-qualified domain name"
# }

//
output "parent_zone_id" {
  value       = module.route53_zone.parent_zone_id
  description = "ID of the hosted zone to contain this record"
}

output "parent_zone_name" {
  value       = module.route53_zone.parent_zone_name
  description = "Name of the hosted zone to contain this record"
}

output "zone_id" {
  value       = module.route53_zone.zone_id
  description = "Route53 DNS Zone ID"
}

output "zone_name" {
  value       = module.route53_zone.zone_name
  description = "Route53 DNS Zone name"
}

output "zone_name_servers" {
  value       = module.route53_zone.zone_name_servers
  description = "Route53 DNS Zone Name Servers"
}

output "fqdn" {
  value       = module.route53_zone.fqdn
  description = "Fully-qualified domain name"
}
