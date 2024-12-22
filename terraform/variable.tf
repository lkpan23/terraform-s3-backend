variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket to store the Terraform state file."
  type        = string
  default     = "cron-lambda-terraform-state-s3-bucket"
}

variable "s3_bucket_versioning_status" {
  description = "The versioning status of the S3 bucket."
  type        = string
  default     = "Enabled"
}

variable "kms_key_deletion_window_in_days" {
  description = "The number of days before the KMS key is deleted."
  type        = number
  default     = 7
}
