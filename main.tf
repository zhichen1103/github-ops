
provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "ap-southeast-1"
    bucket         = "${var.bucket}"
    key            = "${var.key}"
    dynamodb_table = "${var.dynamodb_table}"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
