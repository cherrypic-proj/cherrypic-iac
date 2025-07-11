output "db_instance_id" {
  value       = aws_db_instance.main.id
  description = "RDS 인스턴스 ID"
}

output "db_instance_endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "RDS 접속 엔드포인트"
}
