variable "member_accounts" {
  description = "List of AWS member accounts for security services"
  type        = list(string)
}
variable "region" {
  default = "us-east-1"
}
