# S3 Bucket Module (`modules/storage/s3`)

이 모듈은 AWS S3 버킷을 생성하고, 선택적으로 다음 기능을 구성합니다:
- 버전 관리 (Versioning)
- 서버 측 암호화 (SSE, AES256)
- 퍼블릭 접근 차단 (Public Access Block)

버킷 이름은 `cherrypic-bucket-${purpose}-${environment}` 형식이며, 공통 태그가 함께 설정됩니다.

---

## ✅ 사용 예시

```hcl
module "tf_state_bucket" {
  source = "../modules/storage/s3"

  purpose                    = "tfstate"
  environment                = "dev"
  enable_versioning          = false
  enable_sse                 = true
  enable_block_public_access = true

  tags = {
    Project     = "cherrypic"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
