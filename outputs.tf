output "vpc_id" {
  value = module.vpc.vpc_id
}

output "logging_bucket" {
  value = module.s3_logging.bucket_name
}

output "ec2_dashboard_public_ip" {
  value = module.ec2_dashboard.public_ip
}

output "private_key" {
  description = "The RSA private key for SSH access"
  value       = tls_private_key.rsa.private_key_pem
   sensitive = true
}
