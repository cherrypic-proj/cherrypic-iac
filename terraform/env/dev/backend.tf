terraform {
  backend "s3" {
    bucket         = "cherrypic-bucket-tfstate-dev"
    key            = "dev/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "cherrypic-tfstate-dev"
    encrypt        = true
  }
}
