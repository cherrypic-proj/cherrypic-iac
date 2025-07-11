resource "aws_elasticache_subnet_group" "main" {
  name        = "${var.app_name}-es-subnet-group"
  subnet_ids  = var.subnet_ids
  description = var.subnet_group_description
}

resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.app_name}-${var.purpose}-${var.environment}"
  engine               = "redis"
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.main.name
  security_group_ids   = var.security_group_ids

  tags = merge(
    var.tags,
    {
      Name = "${var.app}-${var.purpose}-${var.environment}"
    }
  )
}

