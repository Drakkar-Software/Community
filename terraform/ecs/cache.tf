module "redis" {
  source = "cloudposse/elasticache-redis/aws"
  version = "0.40.3"

  availability_zones         = var.availability_zones
  zone_id                    = var.dns_zone_id
  vpc_id                     = module.vpc.vpc_id
#  allowed_security_group_ids = [module.vpc.vpc_default_security_group_id]
  subnets                    = module.subnets.private_subnet_ids
  cluster_size               = var.cache_cluster_size
  instance_type              = var.cache_instance_type
  apply_immediately          = true
  automatic_failover_enabled = false
  engine_version             = var.cache_engine_version
  family                     = var.cache_family
  at_rest_encryption_enabled = false
  transit_encryption_enabled = false

  parameter = [
    {
      name  = "notify-keyspace-events"
      value = "lK"
    }
  ]

  context = module.this.context
}
