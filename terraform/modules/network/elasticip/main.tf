resource "aws_eip" "main" {
  domain = var.domain

  tags = merge(
    var.tags,
    {
      Name = "${var.app_name}-eip"
    }
  )
}
