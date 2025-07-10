variable "bucket_name" {
  description = "S3 버킷 이름"
  type        = string
}

variable "enable_versioning" {
  description = "버전 관리 활성화 여부"
  type        = bool
  default     = false
}

variable "enable_sse" {
  description = "서버 사이드 암호화 활성화 여부"
  type        = bool
  default     = true
}

variable "enable_block_public_access" {
  description = "퍼블릭 접근 차단 설정 활성화 여부"
  type        = bool
  default     = true
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
