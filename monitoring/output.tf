output "slack_topic_arn" {
  description = "The ARN of the SNS topic from which messages will be sent to Slack"
  value       = module.notify_slack.slack_topic_arn
}