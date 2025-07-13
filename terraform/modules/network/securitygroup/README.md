#  Security Group Module (`modules/network/security-group`)

이 모듈은 특정 VPC 내에 **보안 그룹(Security Group)**을 생성하며,  
사용자 정의 인바운드(ingress) 및 아웃바운드(egress) 규칙을 설정할 수 있습니다.

CIDR 기반과 보안 그룹 기반 규칙을 구분하여 선언적으로 관리할 수 있습니다.  
보안 그룹 이름은 `${purpose}-${env}-sg` 형식으로 자동 구성됩니다.

---

## ✅ 사용 예시

```hcl
module "bastion_sg" {
  source = "../modules/network/security-group"

  vpc_id     = "vpc-0123456789abcdef0"
  purpose    = "bastion"
  env        = "dev"
  description = "Bastion host SG"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      use_cidr    = true
      use_sg      = false
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Project     = "cherrypic"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
