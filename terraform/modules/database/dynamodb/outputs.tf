output "table_name" {
  description = "생성된 DynamoDB 테이블 이름"
  value       = aws_dynamodb_table.main.name
}

output "table_arn" {
  description = "DynamoDB 테이블 ARN"
  value       = aws_dynamodb_table.main.arn
}
