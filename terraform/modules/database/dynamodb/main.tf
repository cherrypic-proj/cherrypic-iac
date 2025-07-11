resource "aws_dynamodb_table" "main" {
  name           = "${var.app_name}-${var.table_name}-${var.environment}"
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  range_key      = var.range_key
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  dynamic "attribute" {
    for_each = var.range_key != null ? [var.range_key] : []
    content {
      name = attribute.value
      type = var.range_key_type
    }
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.app_name}-${var.environment}-${var.table_name}"
    }
  )
}
