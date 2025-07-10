variable "vpc_id" {
  description = "라우팅 테이블을 연결할 VPC ID"
  type        = string
}

variable "name" {
  description = "리소스 이름 접두어 (예: cherrypic)"
  type        = string
}

variable "type" {
  description = "서브넷 타입 (예: public, private)"
  type        = string
}

variable "tags" {
  description = "공통으로 적용할 태그 맵 (예: Environment, Project 등)"
  type        = map(string)
  default     = {}
}
