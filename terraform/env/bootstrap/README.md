# 📦 Terraform Bootstrap Module

bootstrap 모듈은 `dev` 또는 `prod` 환경을 실행하기 전에 반드시 선행되어야 하는 기본 세팅입니다.
- Terraform 상태 파일(tfstate) 저장을 위한 S3 버킷과 Lock 관리를 위한 DynamoDB 테이블을 생성하는 부트스트랩 모듈입니다.  
- CI/CD 및 협업 환경에서 Terraform 충돌을 방지하고 안전한 상태 관리가 가능하도록 합니다.

---

## 📁 구성 모듈

| 모듈 이름         | 설명 |
|------------------|------|
| `tf_state_bucket` | Terraform 상태 파일을 저장할 S3 버킷 생성 |
| `tf_lock_table`   | 상태 파일 잠금용 DynamoDB 테이블 생성 |

---

## ⚙️ 사용법

```hcl
terraform {
  required_version = ">= 1.12.0"
}

provider "aws" {
  region = "ap-northeast-2"
}

module "tf_state_bucket" {
  source = "../../modules/storage/s3"

  app_name                   = "cherrypic"
  purpose                    = "tfstate"
  environment                = var.environment
  enable_versioning          = false
  enable_sse                 = true
  enable_block_public_access = true
  tags                       = var.tags
}

module "tf_lock_table" {
  source = "../../modules/database/dynamodb"

  environment      = var.environment
  purpose          = "tfstate"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "LockID"
  hash_key_type    = "S"
  range_key        = null
  range_key_type   = null
  read_capacity    = null
  write_capacity   = null
  tags             = var.tags
}
```
- providers에서 자격증명은 생략되어 있습니다. 
- .env파일을 생성하고 AWS access key와 AWS secret access key를 입력해 주세요.
- .envrc를 통해서 초기화 해주세요.
-  나머지 variables에서 요구하는 변수들은 tfvars를 생성해 주입해 주세요.
- terraform apply 이후 dev 또는 prod의 작업을 실행해 주세요.
