resource "aws_cloudwatch_log_group" "cloudops_logs" {
  name              = "/cloudops/platform/logs"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "cloudops-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  alarm_description = "Alarm when CPU exceeds 70%"
}
