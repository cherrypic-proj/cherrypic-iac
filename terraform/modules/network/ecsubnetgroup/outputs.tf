output "elasticache_subnet_group_name" {
  description = "엘라스틱 캐시 서브넷 그룹 이름"
  value       = aws_elasticache_subnet_group.main.name
}
