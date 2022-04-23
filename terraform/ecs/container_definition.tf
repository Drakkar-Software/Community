module "container_definition" {
  source                       = "cloudposse/ecs-container-definition/aws"
  version                      = "0.58.1"
  container_name               = var.container_name
  container_image              = var.container_image
  container_memory             = var.container_memory
  container_memory_reservation = var.container_memory_reservation
  container_cpu                = var.container_cpu
  essential                    = var.container_essential
  readonly_root_filesystem     = var.container_readonly_root_filesystem
  environment                  = [
    {
      name  = "PRODUCTION_DATABASE"
      value = "production"
    },
    {
      name  = "DATABASE_HOST"
      value = module.rds_instance.instance_endpoint
    },
    {
      name  = "DATABASE_PORT"
      value = var.database_port
    },
    {
      name  = "DATABASE_USERNAME"
      value = var.database_user
    },
    {
      name  = "DATABASE_PASSWORD"
      value = var.database_password
    },
    {
      name  = "REDIS_URL"
      value = "redis://${module.redis.endpoint}/1"
    },
    {
      name  = "SECRET_KEY_BASE"
      value = var.app_secret_key_base
    },
    {
      name  = "RAILS_MAX_THREADS"
      value = var.rails_max_thread
    },
    {
      name  = "RAILS_ENV"
      value = var.rails_env
    }
  ]
  port_mappings                = var.container_port_mappings
  log_configuration            = var.container_log_configuration
}
