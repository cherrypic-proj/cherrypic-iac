variable "vpc_id" {
  description = "연결할 VPC ID"
  type        = string
}

variable "app_name" {
  description = "앱 이름 (예: cherrypic)"
  type        = string
}

variable "tags" {
  description =  "공통으로 적용할 태그 맵 (예: Environment, Project 등)"
  type        = map(string)
}
