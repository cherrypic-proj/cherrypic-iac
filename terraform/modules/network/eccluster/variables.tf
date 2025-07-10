variable "app" {
  description = "애플리케이션 이름"
  type        = string
}

variable "environment" {
  description = "환경 이름 (예: dev, prod)"
  type        = string
}

variable "engine_version" {
  description = "Redis 엔진 버전"
  type        = string
  default     = "7.x"
}

variable "node_type" {
  description = "노드 인스턴스 타입 (예: cache.t3.micro)"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  description = "노드 수 (클러스터당)"
  type        = number
  default     = 1
}

variable "parameter_group_name" {
  description = "사용할 파라미터 그룹 이름"
  type        = string
  default     = "default.redis7"
}

variable "port" {
  description = "Redis 포트"
  type        = number
  default     = 6379
}

variable "subnet_group_name" {
  description = "서브넷 그룹 이름"
  type        = string
}

variable "security_group_ids" {
  description = "연결할 보안 그룹 ID 목록"
  type        = list(string)
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
