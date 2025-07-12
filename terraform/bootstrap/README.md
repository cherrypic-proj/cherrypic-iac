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
> ❗ **주의:** 이 과정은 ci/cd에 포함되지 않으며 반드시 최초 1회 수동 실행되어야 합니다.
- providers에서 자격증명은 생략되어 있고 이는 env를 통해서 주입 받습니다.
- .env파일을 생성하고 AWS access key와 AWS secret access key를 입력해 주세요.

> 예시)
> 
> AWS_ACCESS_KEY_ID= (access key)
> 
> AWS_SECRET_ACCESS_KEY= (secret key)
- .envrc를 실행하여 env 파일을 초기화 해주세요.
- 다음으로 환경에 맞는 tfvars를 기준으로 terraform을 실행해 주세요

```bash
# example : dev 환경 초기화

# 초기화: provider 설치 및 backend 연결
terraform init

# 계획 확인: dev 환경 기준으로 리소스 변경 내역 확인
terraform plan -var-file=dev.tfvars

# 적용: 문제가 없다면 실제 인프라 적용
terraform apply -var-file=dev.tfvars
```
- 이후에 생기는 `tfstate`과 같은 파일은 모두 gitignore되어 있으며 커밋하지 않으셔도 됩니다.
