variable "purpose" {
  description = "인스턴스의 용도 (예: was)"
  type        = string
}

variable "environment" {
  description = "배포 환경 (예: dev, prod)"
  type        = string
}

variable "ami_id" {
  description = "EC2 인스턴스에 사용할 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 인스턴스 유형"
  type        = string
}

variable "subnet_id" {
  description = "인스턴스를 실행할 서브넷 ID"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "연결할 보안 그룹 ID 목록"
  type        = list(string)
}

variable "associate_public_ip" {
  description = "퍼블릭 IP 할당 여부"
  type        = bool
}

variable "key_name" {
  description = "SSH 접속을 위한 키 페어 이름"
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "루트 EBS 볼륨 크기 (GB 단위)"
  type        = number
}

variable "root_volume_type" {
  description = "루트 EBS 볼륨 타입 (예: gp2, gp3)"
  type        = string
  default     = "gp3"
}

variable "tags" {
  description = "추가로 인스턴스에 적용할 태그"
  type        = map(string)
  default     = {}
}

variable "eip_allocation_id" {
  description = "할당된 EIP의 ID. 없으면 할당하지 않음."
  type        = string
  default     = ""
}

variable "enable_eip" {
  type    = bool
  default = false
}

