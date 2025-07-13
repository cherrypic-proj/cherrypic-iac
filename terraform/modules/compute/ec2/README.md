# EC2 Instance Module (`modules/compute/ec2`)

이 모듈은 AWS EC2 인스턴스를 생성하고, 선택적으로 퍼블릭 IP를 연결하거나 EIP(Elastic IP)를 연결할 수 있도록 합니다.  
루트 디스크 설정, 태그 구성, 보안 그룹 설정 등을 유연하게 커스터마이징할 수 있습니다.

---

## ✅ 사용 예시

```hcl
module "ec2_instance" {
  source = "../modules/compute/ec2"

  purpose               = "bastion"
  environment           = "dev"
  ami_id                = "ami-0abcd1234efgh5678"
  instance_type         = "t3.micro"
  subnet_id             = "subnet-0123456789abcdef0"
  vpc_security_group_ids = ["sg-0123456789abcdef0"]
  associate_public_ip   = true
  key_name              = "my-key"
  root_volume_size      = 30

  enable_eip            = true
  eip_allocation_id     = "eipalloc-0123456789abcdef0"

  tags = {
    Project = "cherrypic"
    Owner   = "team-infra"
  }
}
