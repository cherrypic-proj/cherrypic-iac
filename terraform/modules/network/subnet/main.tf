resource "aws_subnet" "main" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  tags = merge(
    var.tags,
    {
      Name = "cherrypic-${var.access_level}-subnet-${var.index}"
    }
  )
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = var.route_table_id
}


