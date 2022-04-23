module "alb" {
  source                    = "cloudposse/alb/aws"
  version                   = "0.23.0"

  vpc_id                    = module.vpc.vpc_id
  ip_address_type           = "ipv4"
  subnet_ids                = module.subnets.public_subnet_ids
  security_group_ids        = [module.vpc.vpc_default_security_group_id]
  https_enabled             = true
  http_ingress_cidr_blocks  = ["0.0.0.0/0"]
  https_ingress_cidr_blocks = ["0.0.0.0/0"]
  certificate_arn           = var.certificate_arn
  health_check_interval     = 60

  context = module.this.context
}
