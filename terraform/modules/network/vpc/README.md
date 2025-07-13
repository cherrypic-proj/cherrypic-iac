#  VPC Module (`modules/network/vpc`)

이 모듈은 AWS VPC(Virtual Private Cloud)를 생성합니다.  
CIDR 블록을 지정하고, 표준 태그를 포함하며 `Name = "cherrypic-vpc"` 형식으로 태깅됩니다.  
다른 네트워크 리소스(서브넷, IGW 등)의 상위 구성 요소로 사용됩니다.

---

## ✅ 사용 예시

```hcl
module "vpc" {
  source     = "../modules/network/vpc"
  cidr_block = "10.0.0.0/16"

  tags = {
    Project     = "cherrypic"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
