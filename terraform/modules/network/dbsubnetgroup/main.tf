resource "aws_db_subnet_group" "this" {
  name        = "${var.app}-${var.environment}-db-subnet-group"
  subnet_ids  = var.subnet_ids
  description = var.description
  tags        = merge(
    var.tags,
    {
      Name = "${var.app}-${var.environment}-db-subnet-group"
    }
  )
}
