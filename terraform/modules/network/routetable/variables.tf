variable "vpc_id" {
  description = "라우팅 테이블을 연결할 VPC ID"
  type        = string
}

variable "access_level" {
  description = "인터넷 접근 가능 여부 (예: public, private)"
  type        = string
}

variable "tags" {
  description = "공통으로 적용할 태그 맵 (예: Environment, Project 등)"
  type        = map(string)
  default     = {}
}

variable "igw_id" {
  description = "(옵션) 연결할 인터넷 게이트웨이 ID"
  type        = string
  default     = null
}

variable "destination_cidr_block" {
  description = "(옵션) IGW 라우팅 대상 CIDR (기본: 0.0.0.0/0)"
  type        = string
  default     = "0.0.0.0/0"
}
