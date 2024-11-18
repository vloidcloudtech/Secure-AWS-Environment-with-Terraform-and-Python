output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}



output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = [for subnet in aws_subnet.private : subnet.id]
}
output "dashboard_sg_id" {
  description = "The ID of the security group for the dashboard"
  value       = aws_security_group.dashboard_sg.id
}


