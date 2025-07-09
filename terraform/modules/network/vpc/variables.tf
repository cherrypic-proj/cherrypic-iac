variable "name" {
  description = "리소스 이름 접두어"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR 블록"
  type        = string
}

variable "tags" {
  description = "공통 태그"
  type = object({
    Environment = string
    Project     = string
    Owner       = string
    ManagedBy   = string
  })
}
