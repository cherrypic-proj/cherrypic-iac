variable "environment" {
  type        = string
  description = "환경 (예: dev, staging, prod)"
}

variable "engine" {
  type        = string
  description = "RDS 엔진 이름 (예: mysql, postgres)"
}

variable "engine_version" {
  type        = string
  description = "RDS 엔진 버전"
}

variable "instance_class" {
  type        = string
  description = "RDS 인스턴스 타입"
}

variable "allocated_storage" {
  type        = number
  description = "할당된 스토리지 (GiB)"
}

variable "username" {
  type        = string
  description = "DB 관리자 계정 이름"
}

variable "password" {
  type        = string
  description = "DB 관리자 비밀번호"
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "DB Subnet Group에 포함할 서브넷 ID 리스트"
}

variable "subnet_group_description" {
  type        = string
  default     = "RDS subnet group"
  description = "서브넷 그룹 설명"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "연결할 VPC 보안 그룹 ID 리스트"
}

variable "skip_final_snapshot" {
  type        = bool
  default     = true
  description = "삭제 시 최종 스냅샷을 건너뛸지 여부"
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "인터넷 접근 가능 여부"
}

variable "backup_retention_period" {
  type        = number
  default     = 7
  description = "백업 보존 기간 (일)"
}

variable "parameter_group_family" {
  type        = string
  description = "Parameter group family (예: mysql8.0, postgres15 등)"
}

variable "parameter_group_parameters" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "RDS 파라미터 설정 리스트"
  default     = []
}

variable "db_name" {
  description = "기본으로 생성할 DB 이름"
  type        = string
  default     = "cherrypic"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "공통 태그"
}
