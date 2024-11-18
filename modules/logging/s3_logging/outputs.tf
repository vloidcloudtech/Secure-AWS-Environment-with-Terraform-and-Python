output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.logging.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.logging.arn
}

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.logging.bucket
}

output "versioning_status" {
  description = "The versioning status of the S3 bucket"
  value       = aws_s3_bucket_versioning.logging.versioning_configuration[0].status
}
