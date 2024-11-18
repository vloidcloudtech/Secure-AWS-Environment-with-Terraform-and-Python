# Specify the AWS provider
provider "aws" {
  region = var.region
}

# Generate a unique ID for S3 bucket naming
resource "random_id" "bucket_id" {
  byte_length = 4
}

# S3 Bucket for Centralized Logging
module "s3_logging" {
  source = "./modules/s3_logging"  # Path relative to the root directory
  bucket_name        = var.s3_bucket_name
  log_expiration_days = var.log_expiration_days
}

module "cloudwatch_logs" {
  source = "./modules/cloudwatch_logs"  # Path relative to the root directory
  retention_in_days = var.cloudwatch_retention_days
}


# CloudWatch Log Group for CloudTrail Logs
module "cloudtrail" {
  source = "./cloudtrail"
  s3_bucket_name = module.s3_logging.bucket_name
}


# IAM Role for CloudTrail to Use CloudWatch Logs
module "iam_cloudtrail" {
  source = "./iam_cloudtrail"
}
# CloudTrail Configuration
module "cloudtrail" {
  source                 = "./modules/cloudtrail"
  s3_bucket_name         = module.s3_logging.bucket_name
  cloud_watch_logs_group = module.cloudwatch_logs.log_group_arn
  cloud_watch_role       = module.iam_cloudtrail.role_arn
}

# Security Hub and GuardDuty
module "security_services" {
  source          = "./modules/security_services"
  region          = var.region
  member_accounts = var.member_accounts
}


# Outputs
output "s3_logging_bucket" {
  value       = module.s3_logging.bucket_name
  description = "The name of the S3 bucket used for centralized logging."
}




output "security_hub_status" {
  value       = module.security_services.security_hub_status
  description = "The subscription status of Security Hub CIS AWS Foundations Benchmark."
}
