resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "${var.app_name}-${var.access_level}-rt"
    }
  )
}
