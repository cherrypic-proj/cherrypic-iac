resource "aws_instance" "main" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
  }

  tags = merge(
    var.tags,
    {
      Name = "cherrypic-${var.purpose}-${var.environment}"
    }
  )
}

resource "aws_eip_association" "main" {
  count = var.enable_eip ? 1 : 0

  instance_id   = aws_instance.main.id
  allocation_id = var.eip_allocation_id
}
