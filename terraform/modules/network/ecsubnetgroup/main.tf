resource "aws_elasticache_subnet_group" "main" {
  name        = "${var.app}-${var.environment}-elasticache-subnet-group"
  subnet_ids  = var.subnet_ids
  description = var.description

  tags = merge(
    var.tags,
    {
      Name = "${var.app}-${var.environment}-elasticache-subnet-group"
    }
  )
}
