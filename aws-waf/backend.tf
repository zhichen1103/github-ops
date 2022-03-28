terraform {
  backend "s3" {
    bucket = "chris-terraform-remote-state"
    key = "global/waf/terraform.tfstate"
    region = "ap-southeast-1"

    dynamodb_table = "chris-terraform-locks"
    encrypt = true
  }
}
