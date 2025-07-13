resource "aws_elasticache_subnet_group" "main" {
  name        = "cherrypic-${var.purpose}-subnet-group"
  subnet_ids  = var.subnet_ids
  description = var.subnet_group_description
}

resource "aws_elasticache_replication_group" "main" {
  replication_group_id          = "cherrypic-${var.purpose}-${var.environment}"
  engine                        = var.engine
  engine_version                = var.engine_version
  node_type                     = var.node_type
  num_node_groups               = 1
  replicas_per_node_group       = var.replicas_per_node_group
  automatic_failover_enabled    = false
  port                          = var.port
  subnet_group_name             = aws_elasticache_subnet_group.main.name
  security_group_ids            = var.security_group_ids
  description = "ElastiCache Redis replication group for ${var.environment}"

  tags = merge(
    var.tags,
    {
      Name        = "cherrypic-${var.purpose}-${var.environment}"
    }
  )
}
