variable "app" {
  description = "애플리케이션 이름"
  type        = string
}

variable "environment" {
  description = "환경 이름 (예: dev, prod)"
  type        = string
}

variable "engine" {
  description = "ElastiCache 엔진 (예: redis, memcached)"
  type        = string
}

variable "engine_version" {
  description = "엔진 버전"
  type        = string
  default     = null
}

variable "node_type" {
  description = "노드 인스턴스 타입"
  type        = string
}

variable "num_cache_nodes" {
  description = "노드 개수 (Redis 단일 노드 or Memcached 다중)"
  type        = number
}

variable "parameter_group_name" {
  description = "파라미터 그룹 이름"
  type        = string
  default     = null
}

variable "port" {
  description = "포트"
  type        = number
  default     = 6379
}

variable "subnet_group_name" {
  description = "ElastiCache Subnet Group 이름"
  type        = string
}

variable "subnet_group_description" {
  description = "Subnet Group 설명"
  type        = string
  default     = "Managed by Terraform"
}

variable "subnet_ids" {
  description = "ElastiCache가 배치될 서브넷 ID 목록"
  type        = list(string)
}

variable "security_group_ids" {
  description = "보안 그룹 ID 목록"
  type        = list(string)
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
