variable "name" {
  description = "EIP 리소스 이름 접두어"
  type        = string
}

variable "tags" {
  description = "공통으로 적용할 태그 맵 (예: Environment, Project 등)"
  type        = map(string)
}

variable "domain" {
  description = "EIP 도메인 (보통 vpc)"
  type        = string
  default     = "vpc"
}
