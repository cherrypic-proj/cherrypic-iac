variable "app" {
  description = "애플리케이션 이름"
  type        = string
}

variable "environment" {
  description = "환경 이름 (예: dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "port" {
  description = "Redis 포트"
  type        = number
  default     = 6379
}

variable "allowed_cidr_blocks" {
  description = "접근 허용 CIDR 블록 목록"
  type        = list(string)
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
