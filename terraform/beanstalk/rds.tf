module "rds_instance" {
  source  = "cloudposse/rds/aws"
  version = "0.38.4"

  name                 = "${var.name}-${var.stage}"
  database_name        = var.database_name
  database_user        = var.database_user
  database_password    = var.database_password
  database_port        = var.database_port
  multi_az             = var.database_multi_az
  storage_type         = var.database_storage_type
  allocated_storage    = var.database_allocated_storage
  storage_encrypted    = var.database_storage_encrypted
  engine               = var.database_engine
  engine_version       = var.database_engine_version
  instance_class       = var.database_instance_class
  db_parameter_group   = var.db_parameter_group
  publicly_accessible  = var.database_publicly_accessible
  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.subnets.private_subnet_ids
  security_group_ids   = [module.vpc.vpc_default_security_group_id]
  apply_immediately    = var.database_apply_immediately
  availability_zone    = var.database_availability_zone
  db_subnet_group_name = var.db_subnet_group_name

  db_parameter  = []
  db_options    = []

  context = module.this.context
}
