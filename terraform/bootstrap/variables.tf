variable "environment" {
  description = "환경 이름 (예: dev, prod 등)"
  type        = string
}

variable "tags" {
  description = "공통 태그 맵"
  type        = map(string)
  default     = {}
}

variable "aws_access_key" {
  description = "AWS_ACCESS_KEY"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS_SECRET_KEY"
  type        = string
}
