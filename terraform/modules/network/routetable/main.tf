resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "cherrypic-${var.access_level}-rt"
    }
  )
}

resource "aws_route" "igw" {
  count                  = var.igw_id != null ? 1 : 0
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.igw_id
}
