variable "environment" {
  description = "환경 이름 (예: dev, prod 등)"
  type        = string
}

variable "purpose" {
  description = "사용 용도 (예: tfstate, image)"
  type        = string
}


variable "enable_versioning" {
  description = "버전 관리 활성화 여부"
  type        = bool
  default     = false
}

variable "enable_sse" {
  description = "서버 측 암호화 활성화 여부"
  type        = bool
  default     = false
}

variable "enable_block_public_access" {
  description = "인터넷 접근 차단 활성화 여부"
  type        = bool
  default     = true
}

variable "tags" {
  description = "공통 태그 맵"
  type        = map(string)
  default     = {}
}
