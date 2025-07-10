variable "vpc_id" {
  description = "연결할 VPC ID"
  type        = string
}

variable "name" {
  description = "리소스 이름 접두어"
  type        = string
}

variable "tags" {
  description =  "공통으로 적용할 태그 맵 (예: Environment, Project 등)"
  type        = map(string)
}
