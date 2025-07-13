# Elastic IP (EIP) Module (`modules/network/eip`)

이 모듈은 AWS에서 VPC에 연결 가능한 Elastic IP(EIP)를 생성합니다.  
도메인 설정 및 태그 적용을 지원하며, EC2, NAT Gateway 등의 리소스에 할당 가능한 고정 퍼블릭 IP를 제공합니다.

---

## ✅ 사용 예시

```hcl
module "eip" {
  source = "../modules/network/eip"

  tags = {
    Project     = "cherrypic"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
