variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24"]
}

variable "private_subnets" {
  default = ["10.0.2.0/24"]
}

variable "member_accounts" {
  type    = list(string)
  default = ["123456789012", "098765432109"]
}

variable "key_pair_name" {
  description = "The name of the SSH key pair for EC2 instance access"
  type        = string
  default     = "dashboard-key"
}



variable "instance_type" {
  description = "The EC2 instance type (e.g., t2.micro)"
  type        = string
  default     = "t2.micro"
}
