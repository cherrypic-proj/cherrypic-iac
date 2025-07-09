resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-${var.type}-subnet"
    }
  )
}
