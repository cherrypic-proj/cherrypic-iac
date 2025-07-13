# 🧱 Terraform Modules Overview

이 디렉터리는 프로젝트 인프라 구성을 위한 재사용 가능한 Terraform 모듈들로 구성되어 있습니다.  
각 모듈은 AWS 리소스를 기능별로 분리해 구성하며, 공통 네이밍 규칙과 태깅 전략을 따릅니다.

---

## 📌 네이밍 규칙

- 네이밍 규칙은 아래 표에서 확인해 주세요.

---

## ✅ Modules by Category

### 📡 Network (`modules/network`)

| 구성 요소             | 네이밍 예시                         | 설명                                    |
|----------------------|--------------------------------------|-----------------------------------------|
| **VPC**              | `cherrypic-vpc`                      | 전체 네트워크를 감싸는 가상 네트워크 리소스 |
| **Subnet**           | `cherrypic-public-subnet-1`          | 퍼블릭/프라이빗 서브넷 구성             |
| **Route Table**      | `cherrypic-public-rt`                | 서브넷과 연동되는 라우팅 테이블         |
| **Internet Gateway** | `cherrypic-igw`                      | 외부 인터넷 연결용 게이트웨이           |
| **Elastic IP**       | 없음                                 | 고정 퍼블릭 IP, 네이밍 지정 없음        |
| **Security Group**   | `jenkins-dev-sg`                     | 인스턴스 접근 제어                       |
| **ALB**              | `cherrypic-alb-dev`                  | Application Load Balancer               |
| **Target Group**     | `cherrypic-tg-dev`                   | ALB 뒤의 대상 그룹                      |

---

### 🖥️ Compute (`modules/compute`)

| 구성 요소      | 네이밍 예시                | 설명                         |
|---------------|-----------------------------|------------------------------|
| **EC2**       | `cherrypic-was-dev`         | WAS, bastion 등 목적에 따른 EC2 |
| (예외) Bastion| `cherrypic-bastion-host`    | 퍼블릭 접근이 가능한 점프 서버  |

---

### 🗄️ Database (`modules/database`)

| 구성 요소           | 네이밍 예시             | 설명                         |
|----------------------|--------------------------|------------------------------|
| **RDS**              | `cherrypic-mysql-dev`    | 관계형 DB 인스턴스          |
| (서브넷 그룹)        | `cherrypic-mysql-subnet-group` | DB 전용 서브넷 그룹      |
| (파라미터 그룹)      | `cherrypic-mysql-parameter-group` | DB 설정 커스터마이징 |
| **ElastiCache**      | `cherrypic-cache-dev`    | Redis/Memcached 인스턴스     |
| (서브넷 그룹)        | `cherrypic-cache-subnet-group` | 캐시 전용 서브넷 그룹    |
| **DynamoDB**         | `cherrypic-tfstate-dev` 등 | Key-Value 스토리지 테이블   |

---

### 📦 Storage (`modules/storage`)

| 구성 요소  | 네이밍 예시               | 설명                           |
|------------|----------------------------|--------------------------------|
| **S3**     | `cherrypic-bucket-dev`     | 정적 리소스, tfstate 보관 등 목적별 버킷 |

---

## 🔖 공통 전략

- 모든 모듈은 `tags` 변수를 통해 공통 태그 (`Project`, `Environment`, `ManagedBy`)를 주입받습니다.
- 조건부 리소스 생성을 위한 `count`, `for_each` 패턴을 적극적으로 사용합니다.

---

> 📁 예시 모듈 경로: `modules/network/igw`, `modules/compute/ec2`, `modules/storage/s3` 등

