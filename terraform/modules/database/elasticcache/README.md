# ElastiCache Module (`modules/cache/elasticache`)

이 모듈은 AWS ElastiCache 클러스터(Redis)를 생성하며, VPC 서브넷 그룹과 보안 그룹 설정을 포함합니다.  
환경별, 용도별로 유연한 구성이 가능하며 태그 및 네이밍 전략은 일관성을 유지합니다.

---

## ✅ 사용 예시

```hcl
module "cache" {
  source = "../modules/cache/elasticache"

  purpose                 = "session"
  environment             = "dev"
  engine                  = "redis"
  engine_version          = "7.0"
  node_type               = "cache.t3.micro"
  num_cache_nodes         = 1
  parameter_group_name    = "default.redis7"
  port                    = 6379
  subnet_ids              = ["subnet-0123456789abcdef0", "subnet-abcdef1234567890"]
  security_group_ids      = ["sg-0123456789abcdef0"]

  tags = {
    Project = "cherrypic"
    Owner   = "team-infra"
  }
}
