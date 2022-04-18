module "elastic_beanstalk_environment" {
  source = "cloudposse/elastic-beanstalk-environment/aws"
  version = "0.46.0"

  name                       = var.environment_name
  description                = var.description
  region                     = var.region
  availability_zone_selector = var.availability_zone_selector
  dns_zone_id                = var.dns_zone_id
  dns_subdomain              = var.dns_subdomain

  wait_for_ready_timeout             = var.wait_for_ready_timeout
  elastic_beanstalk_application_name = module.elastic_beanstalk_application.elastic_beanstalk_application_name
  environment_type                   = var.environment_type
  elb_scheme                         = var.elb_scheme
  tier                               = var.tier
  version_label                      = aws_elastic_beanstalk_application_version.application_version.name
  force_destroy                      = var.force_destroy

  loadbalancer_type                  = var.loadbalancer_type
  loadbalancer_certificate_arn       = var.loadbalancer_certificate_arn
  loadbalancer_subnets               = module.subnets.public_subnet_ids

  instance_type    = var.instance_type
  root_volume_size = var.root_volume_size
  root_volume_type = var.root_volume_type

  autoscale_min             = var.autoscale_min
  autoscale_max             = var.autoscale_max
  autoscale_measure_name    = var.autoscale_measure_name
  autoscale_statistic       = var.autoscale_statistic
  autoscale_unit            = var.autoscale_unit
  autoscale_lower_bound     = var.autoscale_lower_bound
  autoscale_lower_increment = var.autoscale_lower_increment
  autoscale_upper_bound     = var.autoscale_upper_bound
  autoscale_upper_increment = var.autoscale_upper_increment

  vpc_id               = module.vpc.vpc_id
  application_subnets  = module.subnets.private_subnet_ids

  allow_all_egress = true
  security_group_name             = ["${var.namespace}-${var.stage}-${var.name}-environment-security-group"]
  additional_security_group_rules = [
    {
      type                     = "ingress"
      from_port                = 0
      to_port                  = 65535
      protocol                 = "-1"
      source_security_group_id = module.vpc.vpc_default_security_group_id
      description              = "Allow all inbound traffic from trusted Security Groups"
    }
  ]

  rolling_update_enabled  = var.rolling_update_enabled
  rolling_update_type     = var.rolling_update_type
  updating_min_in_service = var.updating_min_in_service
  updating_max_batch      = var.updating_max_batch

  healthcheck_url         = var.healthcheck_url
  application_port        = var.application_port

  # https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html
  # https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.docker
  solution_stack_name = var.solution_stack_name

  additional_settings = var.additional_settings
  env_vars            = {
    "PRODUCTION_DATABASE" = var.database_name
    "DATABASE_HOST"       = module.rds_instance.instance_endpoint
    "DATABASE_PORT"       = var.database_port
    "DATABASE_USERNAME"   = var.database_user
    "DATABASE_PASSWORD"   = var.database_password
    "REDIS_URL"           = "redis://${module.redis.endpoint}/1"
    "SECRET_KEY_BASE"     = var.app_secret_key_base
    "RAILS_MAX_THREADS"   = var.rails_max_thread
    "RAILS_ENV"           = var.rails_env
  }

  extended_ec2_policy_document = data.aws_iam_policy_document.minimal_s3_permissions.json
  prefer_legacy_ssm_policy     = false
  prefer_legacy_service_policy = false
  scheduled_actions            = var.scheduled_actions

  context = module.this.context

  depends_on = [module.rds_instance, module.redis, module.vpc]
}
