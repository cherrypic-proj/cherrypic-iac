# RDS Module (`modules/database/rds`)

이 모듈은 AWS RDS 인스턴스를 생성하며, 서브넷 그룹, 파라미터 그룹, 백업 및 접근 정책 등을 유연하게 설정할 수 있습니다.  
MySQL, PostgreSQL 등 다양한 엔진에 대응하며 태그 및 네이밍 규칙은 통일된 인프라 기준을 따릅니다.

---

## ✅ 사용 예시

```hcl
module "rds" {
  source = "../modules/database/rds"

  environment             = "dev"
  engine                  = "mysql"
  engine_version          = "8.0.36"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = "admin"
  password                = "securepassword123!"
  subnet_ids              = ["subnet-0123456789abcdef0", "subnet-abcdef1234567890"]
  vpc_security_group_ids  = ["sg-0123456789abcdef0"]
  skip_final_snapshot     = true
  publicly_accessible     = false
  backup_retention_period = 7
  parameter_group_family  = "mysql8.0"
  parameter_group_parameters = [
    {
      name  = "slow_query_log"
      value = "1"
    },
    {
      name  = "long_query_time"
      value = "2"
    }
  ]

  tags = {
    Project = "cherrypic"
    Owner   = "team-infra"
  }
}
