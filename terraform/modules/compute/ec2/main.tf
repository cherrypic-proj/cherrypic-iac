resource "aws_instance" "main" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip = var.associate_public_ip

  tags = merge(
    var.tags,
    {
      Name = "${var.app_name}-${var.purpose}-${var.environment}"
    }
  )

  dynamic "key_name" {
    for_each = var.key_name != null ? [var.key_name] : []
    content {
      key_name = key_name.value
    }
  }

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
  }
}
