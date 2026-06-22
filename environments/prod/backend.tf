terraform {
  backend "s3" {
    bucket = "dev-app-bucket-dave-994"
    key    = "prod/terraform.tfstate"
    region = "us-east-2"
  }
}
