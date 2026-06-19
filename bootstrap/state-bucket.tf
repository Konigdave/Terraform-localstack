   provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "tf-state-localstack"
}
