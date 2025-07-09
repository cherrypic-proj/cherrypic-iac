output "subnet_id" {
  description = "생성된 서브넷의 ID"
  value       = aws_subnet.main.id
}

output "subnet_arn" {
  description = "생성된 서브넷의 ARN"
  value       = aws_subnet.main.arn
}

output "subnet_cidr_block" {
  description = "서브넷의 CIDR 블록"
  value       = aws_subnet.main.cidr_block
}

output "availability_zone" {
  description = "서브넷이 속한 가용 영역"
  value       = aws_subnet.main.availability_zone
}
