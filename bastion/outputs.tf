output "security_group_id"  { 
    value = "${module.security_group.this_security_group_id}" 
}

output "public_ip"  { 
    value = module.host.public_ip
}
output "public_dns"  { 
    value = module.host.public_dns
}

