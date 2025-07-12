variable "environment" {
  description = "환경 이름 (예: dev, prod)"
  type        = string
}

variable "table_name" {
  description = "논리적 테이블 이름 (prefix 없이)"
  type        = string
}

variable "billing_mode" {
  description = "청구 모드 (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "기본 파티션 키 이름"
  type        = string
}

variable "hash_key_type" {
  description = "파티션 키 타입 (S, N, B)"
  type        = string
}

variable "range_key" {
  description = "정렬 키 이름 (선택)"
  type        = string
  default     = null
}

variable "range_key_type" {
  description = "정렬 키 타입 (S, N, B)"
  type        = string
  default     = "S"
}

variable "read_capacity" {
  description = "읽기 처리 용량 (PROVISIONED 모드 전용)"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "쓰기 처리 용량 (PROVISIONED 모드 전용)"
  type        = number
  default     = 5
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
