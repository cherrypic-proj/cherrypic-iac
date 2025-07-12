locals {
  env = "dev"

  common_tags = {
    App     = "cherrypic"
    Environment = "dev"
    Team       = "backend"
    ManagedBy   = "terraform"
  }
}
