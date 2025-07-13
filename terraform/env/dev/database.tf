# ============= RDS ===============

module "rds_mysql" {
  source = "../../modules/database/rds"

  engine            = "mysql"
  engine_version    = "8.4.3"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = var.username
  password          = var.password

  vpc_security_group_ids = [
    module.db_dev_sg.id
  ]

  subnet_ids = [
    module.private_subnet_1.id,
    module.private_subnet_2.id
  ]

  parameter_group_family = "mysql8.4"

  subnet_group_description = "DB Subnet Group"
  skip_final_snapshot      = true
  publicly_accessible      = false
  backup_retention_period  = 7

  environment = local.env
  tags        = local.common_tags
}

# ============= Elastic Cache ===============

module "cache_dev" {
  source                   = "../../modules/database/elasticcache"
  environment              = "dev"
  purpose                  = "cache"
  subnet_ids               = [module.private_subnet_1.id, module.private_subnet_2.id]
  security_group_ids       = [module.cache_dev_sg.id]
  node_type                = "cache.t2.micro"
  num_cache_nodes          = 1
  engine                   = "redis"
  engine_version           = "8.0"
  parameter_group_name     = "default.valkey8"
  port                     = 6379
  subnet_group_description = "Cherrypic cache subnet group"
  tags                     = local.common_tags
}
