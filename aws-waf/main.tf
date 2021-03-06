
provider "aws" {
  region = "ap-southeast-1"
}

module "label" {
  source      = "cloudposse/label/null"
  version     = "0.25.0"
  namespace   = "demo"
  environment = "dev"
  name        = "aws-waf-demo"
  delimiter   = "-"

  tags = {
    "BusinessUnit" = "demo",
  }
}

module "waf" {
  source  = "cloudposse/waf/aws"
  version = "0.0.3"

  geo_match_statement_rules = [
    {
      name     = "Block_Ukraine-Russia"
      action   = "block"
      priority = 10

      statement = {
        country_codes = ["UA", "RU"]
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        sampled_requests_enabled   = true
        metric_name                = "Block_Ukraine-Russia"
      }
    }
  ]

  context = module.label.context
}

