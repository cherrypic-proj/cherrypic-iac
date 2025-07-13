resource "aws_eip" "main" {
  domain = var.domain

  tags = var.tags
}
