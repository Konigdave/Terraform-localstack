variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}
