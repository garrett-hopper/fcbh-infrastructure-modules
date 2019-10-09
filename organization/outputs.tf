output "organization_id" {
  value = aws_organizations_organization.org.roots.0.id
}

output "organization_master_account_id" {
  value = aws_organizations_organization.org.master_account_id
}