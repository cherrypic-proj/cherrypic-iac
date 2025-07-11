output "instance_id" {
  description = "생성된 EC2 인스턴스의 ID"
  value       = aws_instance.main.id
}

output "public_ip" {
  description = "EC2 인스턴스의 퍼블릭 IP (있는 경우)"
  value       = aws_instance.main.public_ip
}

output "private_ip" {
  description = "EC2 인스턴스의 프라이빗 IP"
  value       = aws_instance.main.private_ip
}
