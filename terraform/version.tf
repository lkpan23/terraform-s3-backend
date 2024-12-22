terraform {
  required_version = ">= 1.10"

  # Manually create this s3 backend bucket for storing the terraform state
  backend "s3" {
    use_lockfile = true
    # bucket = "cron-lambda-terraform-state-s3-bucket"
    # key    = "lambda-cron/terraform.tfstate"
    # region = var.aws_region
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
