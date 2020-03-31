
output "arn" {
  value       = aws_sns_topic.default.arn
  description = "SNS Topic ARN"
}