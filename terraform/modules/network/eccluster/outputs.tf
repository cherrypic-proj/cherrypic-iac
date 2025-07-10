output "elasticache_cluster_id" {
  description = "엘라스틱 캐시 클러스터 ID"
  value       = aws_elasticache_cluster.main.id
}

output "elasticache_endpoint" {
  description = "엘라스틱 캐시 엔드포인트 주소"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}

output "elasticache_port" {
  description = "엘라스틱 캐시 포트"
  value       = aws_elasticache_cluster.main.cache_nodes[0].port
}
