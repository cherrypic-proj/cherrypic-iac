# DynamoDB Table Module (`modules/database/dynamodb`)

이 모듈은 AWS DynamoDB 테이블을 생성하며, 청구 모드(`PROVISIONED` 또는 `PAY_PER_REQUEST`), 해시 키, 정렬 키 설정 등을 유연하게 지원합니다.  
태그, 용도별 네이밍 등은 공통 인프라 스타일을 따릅니다.

---

## ✅ 사용 예시

```hcl
module "tf_lock_table" {
  source = "../modules/database/dynamodb"

  purpose        = "tfstate"
  environment    = "dev"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  hash_key_type  = "S"
  range_key      = null
  range_key_type = null
  read_capacity  = null
  write_capacity = null

  tags = {
    Project = "cherrypic"
    Owner   = "team-infra"
  }
}
