#  Route Table Module (`modules/network/route-table`)

이 모듈은 특정 VPC 내에 **라우팅 테이블(Route Table)**을 생성하고,  
필요한 경우 **인터넷 게이트웨이(IGW)로의 라우트도 자동으로 설정**할 수 있습니다.

`access_level` 값에 따라 퍼블릭/프라이빗 라우팅 테이블 네이밍을 구분하며,  
IGW 경로는 `enable_igw_route = true`로 설정 시 생성됩니다.

---

## ✅ 사용 예시

```hcl
module "route_table_public" {
  source = "../modules/network/route-table"

  vpc_id                 = "vpc-0123456789abcdef0"
  access_level           = "public"
  igw_id                 = "igw-0abcd1234ef567890"
  enable_igw_route       = true
  destination_cidr_block = "0.0.0.0/0"

  tags = {
    Project     = "cherrypic"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
