variable "app_name" {
  description = "애플리케이션 이름 (예: cherrypic)"
  type        = string
}

variable "purpose" {
  description = "캐시 용도 (예: cache, session 등)"
  type        = string
}

variable "environment" {
  description = "환경 이름 (예: dev, prod 등)"
  type        = string
}

variable "engine_version" {
  description = "Redis 엔진 버전 (예: 7.0)"
  type        = string
}

variable "node_type" {
  description = "ElastiCache 인스턴스 타입 (예: cache.t3.micro)"
  type        = string
}

variable "num_cache_nodes" {
  description = "캐시 노드 개수"
  type        = number
}

variable "parameter_group_name" {
  description = "ElastiCache 파라미터 그룹 이름"
  type        = string
}

variable "port" {
  description = "Redis 접근 포트 (기본값: 6379)"
  type        = number
  default     = 6379
}

variable "subnet_ids" {
  description = "ElastiCache 서브넷 그룹에 포함할 서브넷 ID 리스트"
  type        = list(string)
}

variable "subnet_group_description" {
  description = "ElastiCache 서브넷 그룹 설명"
  type        = string
  default     = "Elasticache subnet group"
}

variable "security_group_ids" {
  description = "ElastiCache 인스턴스에 적용할 보안 그룹 리스트"
  type        = list(string)
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
