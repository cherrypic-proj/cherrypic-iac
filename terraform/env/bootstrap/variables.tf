variable "environment" {
  description = "환경 이름 (예: dev, prod 등)"
  type        = string
}

variable "table_name" {
  description = "dynamoDB 테이블 이름"
  type        = string
}

variable "tags" {
  description = "공통 태그 맵"
  type        = map(string)
  default     = {}
}
