terraform {
    required_version = ">= 0.11.2"

    backend "s3" {
        bucket          = "tf-remote-state-gregkessman"
        key             = "terraform.tfstate"
        region          = "us-east-1"
        encrypt         = "true"
        dynamodb_table  = "tf-remote-state-gregkessman"
    }
}

provider "aws" {
  alias               = "virginia"
  allowed_account_ids = [697137303006]
  region              = "us-east-1"
}

variable "domain" {
  description = "DNS domain for web S3 distribution - (ex. gregkessman.com)"
  type        = "string"
  default     = "gregkessman.com"
}

variable "bucket_name" {
  description = "Name of web S3 bucket"
  type        = "string"
  default     = "gregkessman.com"
}

data "aws_acm_certificate" "web" {
  domain   = "${var.domain}"
  statuses = ["ISSUED", "PENDING_VALIDATION"]
  provider = "aws.virginia"
}