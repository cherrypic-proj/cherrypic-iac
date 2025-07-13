resource "aws_db_subnet_group" "main" {
  name        = "cherrypic-${var.engine}-subnet-group"
  subnet_ids  = var.subnet_ids
  description = var.subnet_group_description
  tags        = var.tags
}

resource "aws_db_parameter_group" "main" {
  name   = "cherrypic-${var.engine}-parameter-group"
  family = var.parameter_group_family

  dynamic "parameter" {
    for_each = var.parameter_group_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = var.tags
}

resource "aws_db_instance" "main" {
  identifier              = "cherrypic-${var.engine}-${var.environment}"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  username                = var.username
  password                = var.password
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = var.vpc_security_group_ids
  skip_final_snapshot     = var.skip_final_snapshot
  publicly_accessible     = var.publicly_accessible
  backup_retention_period = var.backup_retention_period
  parameter_group_name    = aws_db_parameter_group.main.name
  db_name = var.db_name

  tags = merge(
    var.tags,
    {
      Name = "cherrypic-${var.environment}-${var.engine}"
    }
  )
}
