output "dashboard_instance_id" {
  description = "The ID of the EC2 dashboard instance"
  value       = aws_instance.dashboard.id
}

output "public_ip" {
  description = "The public IP address of the EC2 dashboard instance"
  value       = aws_instance.dashboard.public_ip
}
