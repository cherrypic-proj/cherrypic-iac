variable "environment" {
  description = "환경 이름 (예: dev, prod 등)"
  type        = string
}

variable "tags" {
  description = "공통 태그 맵"
  type        = map(string)
  default     = {}
}

variable "access_key_id" {
  description = "AWS access key id"
  type        = string
}

variable "secret_access_key" {
  description = "AWS secret access key"
  type        = string
}
