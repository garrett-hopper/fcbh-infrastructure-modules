output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.requester_connection.id
}