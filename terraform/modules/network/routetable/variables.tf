variable "vpc_id" {
  description = "라우팅 테이블을 연결할 VPC ID"
  type        = string
}

variable "name" {
  description = "앱 이름 (예: cherrypic)"
  type        = string
}

variable "access_level" {
  description = "서브넷 공개 여부 (예: public, private)"
  type        = string
}

variable "tags" {
  description = "공통으로 적용할 태그 맵 (예: Environment, Project 등)"
  type        = map(string)
  default     = {}
}
