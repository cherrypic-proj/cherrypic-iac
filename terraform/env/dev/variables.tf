variable "access_key_id" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "secret_access_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "RDS 마스터 사용자 이름"
  type        = string
}

variable "password" {
  description = "RDS 마스터 사용자 비밀번호"
  type        = string
  sensitive   = true
}
