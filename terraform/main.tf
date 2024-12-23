resource "aws_kms_key" "tf_state_encryption_key" {
  description             = "This key is used to encrypt tf_state bucket objects"
  deletion_window_in_days = var.kms_key_deletion_window_in_days
}

resource "aws_s3_bucket" "terraform_states" {
  bucket        = var.s3_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "lambda_bucket_access_block" {
  bucket = aws_s3_bucket.terraform_states.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "tf_versioning" {
  bucket = aws_s3_bucket.terraform_states.id
  versioning_configuration {
    status = var.s3_bucket_versioning_status
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_encryption" {
  bucket = aws_s3_bucket.terraform_states.bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tf_state_encryption_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
