output "elasticache_cluster_id" {
  value       = aws_elasticache_cluster.main.id
  description = "ElastiCache 클러스터 ID"
}

output "elasticache_endpoint" {
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
  description = "ElastiCache 클러스터 엔드포인트"
}

output "elasticache_port" {
  value       = aws_elasticache_cluster.main.cache_nodes[0].port
  description = "ElastiCache 클러스터 포트"
}
