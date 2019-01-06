terraform {
    backend "s3" {
        bucket = "gregkessman-terraform-backend"
        key = "portfolio-2019.tfstate"
        region = "us-east-1"
    }
}