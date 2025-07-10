output "rds_instance_id" {
  description = "RDS 인스턴스 ID"
  value       = aws_db_instance.main.id
}

output "rds_endpoint" {
  description = "RDS 인스턴스 엔드포인트 주소"
  value       = aws_db_instance.main.endpoint
}

output "rds_address" {
  description = "RDS 도메인 주소"
  value       = aws_db_instance.main.address
}
