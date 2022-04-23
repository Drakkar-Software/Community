module "elastic_beanstalk_application" {
  source  = "cloudposse/elastic-beanstalk-application/aws"
  version = "0.11.1"

  name        = var.name
  description = var.description

  context = module.this.context
}
