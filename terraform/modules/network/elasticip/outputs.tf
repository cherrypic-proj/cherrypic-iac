output "id" {
  description = "EIP의 ID"
  value       = aws_eip.main.id
}

output "public_ip" {
  description = "EIP의 퍼블릭 IP"
  value       = aws_eip.main.public_ip
}
