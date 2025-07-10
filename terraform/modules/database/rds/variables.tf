variable "app" {
  description = "애플리케이션 이름"
  type        = string
}

variable "environment" {
  description = "환경 이름 (예: dev, prod)"
  type        = string
}

variable "engine" {
  description = "데이터베이스 엔진 (예: mysql, postgres)"
  type        = string
}

variable "engine_version" {
  description = "엔진 버전"
  type        = string
}

variable "instance_class" {
  description = "RDS 인스턴스 타입"
  type        = string
}

variable "allocated_storage" {
  description = "할당된 스토리지 (GiB 단위)"
  type        = number
}

variable "username" {
  description = "마스터 사용자 이름"
  type        = string
}

variable "password" {
  description = "마스터 사용자 비밀번호"
  type        = string
  sensitive   = true
}

variable "db_subnet_group_name" {
  description = "연결할 DB 서브넷 그룹 이름"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "연결할 보안 그룹 ID 목록"
  type        = list(string)
}

variable "skip_final_snapshot" {
  description = "삭제 시 최종 스냅샷 생략 여부"
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "퍼블릭 접근 허용 여부"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "백업 보관 일수"
  type        = number
}

variable "tags" {
  description = "공통 태그"
  type        = map(string)
  default     = {}
}
