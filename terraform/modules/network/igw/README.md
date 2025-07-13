# Internet Gateway Module (`modules/network/igw`)

이 모듈은 AWS VPC에 연결되는 Internet Gateway(IGW)를 생성합니다.  
퍼블릭 서브넷에서 외부 인터넷과 통신이 가능하도록 하기 위한 필수 구성 요소입니다.  
태그는 공통 형식을 따르며 기본 `Name = "cherrypic-igw"`로 설정됩니다.

---

## ✅ 사용 예시

```hcl
module "internet_gateway" {
  source = "../modules/network/igw"

  vpc_id = "vpc-0123456789abcdef0"

  tags = {
    Project     = "cherrypic"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
