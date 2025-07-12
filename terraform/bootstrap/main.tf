terraform {
  required_version = ">= 1.12.0"
}

provider "aws" {
  region  = "ap-northeast-2"
}

module "tf_state_bucket" {
  source = "../modules/storage/s3"

  purpose                    = "tfstate"
  environment                = var.environment
  enable_versioning          = false
  enable_sse                 = true
  enable_block_public_access = true
  tags                       = var.tags
}

module "tf_lock_table" {
  source = "../modules/database/dynamodb"

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
