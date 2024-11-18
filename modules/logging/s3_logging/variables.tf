# Bucket Name
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

# Force Destroy Bucket
variable "force_destroy" {
  description = "Force destroy the bucket, even if it contains objects"
  type        = bool
  default     = false
}

# Environment Tag
variable "environment" {
  description = "Environment tag for the bucket"
  type        = string
  default     = "dev"
}

# KMS Master Key ID for Encryption
variable "kms_master_key_id" {
  description = "KMS Master Key ID for server-side encryption (leave empty for AES256)"
  type        = string
  default     = ""
}

# SSE Algorithm
variable "sse_algorithm" {
  description = "Server-side encryption algorithm (AES256 or aws:kms)"
  type        = string
  default     = "AES256"
}

# Lifecycle Rules
variable "noncurrent_version_expiration_days" {
  description = "Number of days to retain noncurrent object versions"
  type        = number
  default     = 30
}

# Public Access Block
variable "block_public_acls" {
  description = "Whether to block public ACLs"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether to block public bucket policies"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether to ignore public ACLs"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether to restrict public bucket access"
  type        = bool
  default     = true
}
