variable "vpc_id" {
  type        = string
  description = "이 서브넷이 속할 VPC의 ID입니다."
}

variable "cidr_block" {
  type        = string
  description = "서브넷에 할당할 CIDR 블록입니다."
}

variable "availability_zone" {
  type        = string
  description = "서브넷이 생성될 가용 영역(Availability Zone)입니다."
}

variable "access_level" {
  type        = string
  description = "서브넷의 접근 수준입니다. 예: public, private"
}

variable "index" {
  type        = number
  description = "서브넷 번호입니다. 예: 1, 2 등 (이름 구분용)"
}

variable "tags" {
  type        = map(string)
  description = "공통적으로 적용할 태그들입니다."
}

variable "route_table_id" {
  type        = string
  description = "이 서브넷과 연결할 라우팅 테이블의 ID입니다."
}
