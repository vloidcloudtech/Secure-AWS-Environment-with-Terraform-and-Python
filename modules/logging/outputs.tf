output "bucket_name" {
  value = module.s3_logging.bucket_name
}

output "cloudtrail_arn" {
  value = module.cloudtrail.cloudtrail_arn
}

output "iam_role_arn" {
  value = module.iam_cloudtrail.role_arn
}

output "log_group_arn" {
  value = module.cloudwatch_logs.log_group_arn
}

output "security_services_status" {
  value = module.security_services.status
}
