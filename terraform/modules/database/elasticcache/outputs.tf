output "cluster_id" {
  description = "ElastiCache 클러스터 ID"
  value       = aws_elasticache_cluster.main.id
}

output "endpoint" {
  description = "접속 엔드포인트 주소"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}

output "port" {
  description = "접속 포트"
  value       = aws_elasticache_cluster.main.cache_nodes[0].port
}
