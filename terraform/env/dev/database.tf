# ============= RDS ===============

module "rds_mysql" {
  source = "../../modules/database/rds"

  engine             = "mysql"
  engine_version     = "8.4.3"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  username = var.username
  password = var.password

  vpc_security_group_ids = [
    module.db_dev_sg
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
