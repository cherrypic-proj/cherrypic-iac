resource "aws_security_group" "main" {
  name        = "${var.purpose}-${var.env}-sg"
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "${var.purpose}-${var.env}-sg"
    }
  )
}

resource "aws_security_group_rule" "ingress_cidr" {
  for_each = {
    for idx, rule in var.ingress_rules :
    idx => rule if contains(keys(rule), "cidr_blocks")
  }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.main.id
}

resource "aws_security_group_rule" "ingress_sg" {
  for_each = {
    for idx, rule in var.ingress_rules :
    idx => rule if contains(keys(rule), "source_security_group_id")
  }

  type                     = "ingress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.source_security_group_id
  security_group_id        = aws_security_group.main.id
}

resource "aws_security_group_rule" "egress" {
  for_each = {
    for idx, rule in var.egress_rules :
    idx => rule
  }

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.main.id
}
