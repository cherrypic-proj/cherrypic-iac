#  Subnet Module (`modules/network/subnet`)

이 모듈은 지정된 VPC 내에 서브넷을 생성하고, 해당 서브넷을 특정 라우팅 테이블과 연결합니다.  
`Name` 태그는 `"cherrypic-${access_level}-subnet-${index}"` 형식으로 지정됩니다.  
퍼블릭/프라이빗 서브넷 구성 시 반복적으로 사용할 수 있도록 설계되었습니다.

---

## ✅ 사용 예시

```hcl
module "public_subnet_1" {
  source = "../modules/network/subnet"

  vpc_id            = "vpc-0123456789abcdef0"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  access_level      = "public"
  index             = 1
  route_table_id    = module.public_route_table.id

  tags = {
    Project     = "cherrypic"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
