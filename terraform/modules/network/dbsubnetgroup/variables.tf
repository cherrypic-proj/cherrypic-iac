variable "app" {
  description = "애플리케이션 이름"
  type        = string
}

variable "environment" {
  description = "환경 이름 (예: dev, prod)"
  type        = string
}

variable "subnet_ids" {
  description = "서브넷 ID 리스트"
  type        = list(string)
}

variable "description" {
  description = "서브넷 그룹 설명"
  type        = string
  default     = "Database subnet group"
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
