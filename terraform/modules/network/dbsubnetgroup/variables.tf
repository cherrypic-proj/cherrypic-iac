variable "name" {
  description = "DB 서브넷 그룹 이름"
  type        = string
}

variable "subnet_ids" {
  description = "서브넷 ID 목록"
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
