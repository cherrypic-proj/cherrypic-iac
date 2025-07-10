variable "vpc_id" {
  description = "이 서브넷이 속할 VPC의 ID"
  type        = string
}

variable "cidr_block" {
  description = "이 서브넷에 할당할 IPv4 CIDR 블록"
  type        = string
}

variable "availability_zone" {
  description = "서브넷을 생성할 가용 영역 (예: ap-northeast-2a)"
  type        = string
}

variable "tags" {
  description = "공통으로 적용할 태그 맵 (예: Environment, Project 등)"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name 태그의 접두사 (예: cherrypic)"
  type        = string
}

variable "type" {
  description = "서브넷의 타입 (예: public, private)"
  type        = string
}

variable "index" {
  description = "서브넷 번호 (1부터 시작)"
  type        = number
}
