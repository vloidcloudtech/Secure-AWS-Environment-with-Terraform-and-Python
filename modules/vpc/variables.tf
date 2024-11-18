variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A map of public subnet CIDRs"
  type        = map(string)
}

variable "private_subnets" {
  description = "A map of private subnet CIDRs"
  type        = map(string)
}
# Remove or comment out this block if it exists
# variable "vpc_id" {
#   description = "The ID of the VPC"
#   type        = string
# }
