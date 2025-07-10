resource "aws_db_instance" "main" {
  identifier              = "${var.app}-${var.environment}-${var.engine}"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  username                = var.username
  password                = var.password
  db_subnet_group_name    = var.db_subnet_group_name
  vpc_security_group_ids  = var.vpc_security_group_ids
  skip_final_snapshot     = var.skip_final_snapshot
  publicly_accessible     = var.publicly_accessible
  backup_retention_period = var.backup_retention_period

  tags = merge(
    var.tags,
    {
      Name = "${var.app}-${var.environment}-${var.engine}"
    }
  )
}
