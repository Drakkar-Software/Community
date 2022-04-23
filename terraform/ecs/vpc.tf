module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "0.18.0"

  cidr_block = var.vpc_cidr_block

  context = module.this.context
}
