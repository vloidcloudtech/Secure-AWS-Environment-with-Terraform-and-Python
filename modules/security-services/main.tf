provider "aws" {
  region = var.region
}

# Enable GuardDuty
resource "aws_guardduty_detector" "main" {
  enable = true
}

# Enable Security Hub
resource "aws_securityhub_account" "main" {}

# Subscribe to CIS AWS Foundations Benchmark
resource "aws_securityhub_standards_subscription" "cis" {

  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on = [aws_securityhub_account.main]
}

# GuardDuty Members for Other Accounts
resource "aws_guardduty_member" "members" {
  for_each    = toset(var.member_accounts)
  account_id  = each.value
  email       = "security+${each.value}@example.com"
  detector_id = aws_guardduty_detector.main.id
  invitation_message = "GuardDuty is enabled in your account."
}



# Outputs
output "cis_standard_status" {
  value       = aws_securityhub_standards_subscription.cis.id
  description = "The CIS AWS Foundations Benchmark subscription status."
}
