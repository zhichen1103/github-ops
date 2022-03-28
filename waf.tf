module "waf" {
  source = "cloudposse/waf/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version = "x.x.x"

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
        sampled_requests_enabled   = false
        metric_name                = "Block_Ukraine-Russia"
      }
    }
  ]

  context = module.label.context
}
