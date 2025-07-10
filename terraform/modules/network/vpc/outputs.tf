output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "vpc_tags" {
  description = "적용된 VPC 태그"
  value       = aws_vpc.main.tags
}
