variable "app_name" {
  description = "앱 이름 ex) cherrypic"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR 블록"
  type        = string
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
