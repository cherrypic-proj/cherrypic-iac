#  dev 환경 인프라 구성

이 디렉터리는 `dev` 환경의 인프라 구성을 위한 Terraform 설정 파일들을 포함합니다.  
운영 환경별로 리소스를 기능/도메인 단위로 분리하고, Terraform 베스트 프랙티스를 따릅니다.

---

## 📁 파일 구조 및 역할

| 파일명             | 설명                                                                 |
|------------------|----------------------------------------------------------------------|
| `backend.tf`     | S3 + DynamoDB 기반 상태 저장소(Backend) 구성                             |
| `provider.tf`    | AWS Provider 설정 (`region`, `version` 등)                            |
| `locals.tf`      | 공통적으로 사용하는 지역 변수 정의 (태그, 이름 규칙 등)                 |
| `variables.tf`   | 전체 환경에서 사용하는 입력 변수 정의                                    |
| `terraform.tf`   | Terraform 블록 버전 및 provider 요구사항 정의                            |
| `data.tf`        | `data` 블록을 통한 외부 리소스 참조 (AMI, AZ 목록 등)                   |
| `network.tf`     | VPC, Subnet, Route Table, IGW 등 네트워크 인프라 구성                     |
| `compute.tf`     | EC2, Bastion Host, EIP 등 컴퓨팅 리소스 구성                              |
| `database.tf`    | RDS, ElastiCache, DynamoDB 등 데이터베이스 리소스 구성                    |
| `README.md`      | 해당 환경의 구조와 설정 방식에 대한 문서                                 |

> 모든 리소스는 `modules/` 하위의 재사용 가능한 모듈을 호출하여 생성됩니다.  
> 모듈 내부에 공통 태그, 이름 규칙, 조건부 생성을 반영하여 코드 중복을 줄입니다.

---

## 🔖 구조 분리 기준

Terraform은 파일명을 기준으로 모듈처럼 동작하지 않기 때문에 **하나의 `.tf` 파일이 여러 개 있어도 동시에 처리**됩니다.  
그럼에도 파일을 **기능별로 분리**하는 이유는 다음과 같습니다:

1. **코드 가독성 향상**
    - 예: `network.tf`만 열어도 서브넷이나 IGW를 바로 찾을 수 있음

2. **협업 시 충돌 최소화**
    - 각 엔지니어가 서로 다른 `.tf` 파일을 작업하면 merge conflict를 줄일 수 있음

3. **리뷰 및 테스트 효율성**
    - 기능별 변경이 명확하여 `plan` 단계에서 영향 범위 추적이 쉬움

---

## 📘 참고

이 구조는 다음의 Terraform 공식 권장 사항 및 사례를 기반으로 설계되었습니다:

- HashiCorp 공식 문서: [https://developer.hashicorp.com/terraform/language](https://developer.hashicorp.com/terraform/language)

