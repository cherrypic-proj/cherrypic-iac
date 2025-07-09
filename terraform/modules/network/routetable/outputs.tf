output "route_table_id" {
  description = "생성된 라우팅 테이블 ID"
  value       = aws_route_table.main.id
}

output "route_table_arn" {
  description = "라우팅 테이블 ARN"
  value       = aws_route_table.main.arn
}
