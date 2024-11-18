# Remove this block from variables.tf
# variable "ami_id" {
#   description = "The AMI ID to use for the EC2 instance"
#   type        = string
# }


variable "instance_type" {
  description = "The EC2 instance type to use (e.g., t2.micro)"
  type        = string
  default     = "t2.micro" # Optional: Default to t2.micro for convenience
}


variable "subnet_id" {
  description = "The ID of the subnet to deploy the instance in"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for the EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be created"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the SSH key pair for EC2 instance access"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}
