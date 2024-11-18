variable "s3_bucket_name" {
  description = "Name of the S3 bucket for centralized logging"
  type        = string
}

variable "cloudtrail_name" {
  description = "Name of the CloudTrail"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role for CloudTrail"
  type        = string
}

variable "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch Log Group"
  type        = string
}

variable "cloudwatch_retention_in_days" {
  description = "Retention period for CloudWatch Logs"
  type        = number
  default     = 90
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "member_accounts" {
  description = "List of AWS member accounts for security services"
  type        = list(string)
  default     = []
}
