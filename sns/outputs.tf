
output "arn" {
  value       = aws_sns_topic.default.arn
  description = "SNS Topic ARN"
}

output "topic_name" {
  value       = local.topic_name
  description = "SNS Topic Name"
}