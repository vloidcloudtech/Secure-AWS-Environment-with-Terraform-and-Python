resource "aws_cloudwatch_log_group" "trail_logs" {
  name              = "/aws/cloudtrail/logs"
  retention_in_days = var.retention_in_days

  tags = {
    Name = "CloudTrailLogGroup"
  }
}
