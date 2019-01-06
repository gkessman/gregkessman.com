resource "aws_s3_bucket" "portfolio" {
  tags { Name = "Portfolio Website Bucket" }

  bucket = "gregkessman.com"
  acl = "public-read"

  website {
      index_document = "index.html"
      error_document = "error.html"
  }
}
