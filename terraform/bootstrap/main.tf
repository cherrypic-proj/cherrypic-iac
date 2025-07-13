terraform {
  required_version = ">= 1.12.0"
}

provider "aws" {
  region     = "ap-northeast-2"
  access_key = var.access_key_id
  secret_key = var.secret_access_key
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
