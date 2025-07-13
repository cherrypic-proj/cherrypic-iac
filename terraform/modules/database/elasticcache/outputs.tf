output "elasticache_cluster_id" {
  value       = aws_elasticache_replication_group.main.id
  description = "ElastiCache 클러스터 ID"
}

output "elasticache_primary_endpoint" {
  value       = aws_elasticache_replication_group.main.primary_endpoint_address
  description = "ElastiCache 클러스터 엔드포인트"
}

output "elasticache_port" {
  value = aws_elasticache_replication_group.main.port
  description = "ElastiCache 클러스터 포트"
}
