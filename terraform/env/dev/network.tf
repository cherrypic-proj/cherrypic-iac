# ============= VPC ===============

module "vpc" {
  source = "../../modules/network/vpc"

  cidr_block = "10.0.0.0/16"
}

# ============= Internet Gateway ===============

module "internet_gateway" {
  source = "../../modules/network/igw"
  vpc_id = module.vpc.id
  tags   = local.common_tags
}

# ============= Route Table ===============

module "public_route_table" {
  source                 = "../../modules/network/routetable"
  vpc_id                 = module.vpc.id
  access_level           = "public"
  igw_id                 = module.internet_gateway.id
  destination_cidr_block = "0.0.0.0/0"
  enable_igw_route       = true
  tags                   = local.common_tags
}

module "private_route_table" {
  source           = "../../modules/network/routetable"
  vpc_id           = module.vpc.id
  access_level     = "private"
  enable_igw_route = false
  tags             = local.common_tags
}

# ============= Security Group ===============

module "was_dev_sg" {
  source      = "../../modules/network/securitygroup"
  purpose     = "was"
  env         = local.env
  description = "WAS Security Group"
  vpc_id      = module.vpc.id

  ingress_rules = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = local.common_tags
}

module "bastion_dev_sg" {
  source      = "../../modules/network/securitygroup"
  purpose     = "bastion-host"
  env         = local.env
  description = "Bastion Host Security Group"
  vpc_id      = module.vpc.id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = local.common_tags
}

module "cache_dev_sg" {
  source      = "../../modules/network/securitygroup"
  purpose     = "cache"
  env         = local.env
  description = "Cache Dev Security Group"
  vpc_id      = module.vpc.id

  ingress_rules = [
    {
      from_port                = 6379
      to_port                  = 6379
      protocol                 = "tcp"
      source_security_group_id = module.bastion_dev_sg.id
    },
    {
      from_port                = 6379
      to_port                  = 6379
      protocol                 = "tcp"
      source_security_group_id = module.was_dev_sg.id
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = local.common_tags
}

module "jenkins_dev_sg" {
  source      = "../../modules/network/securitygroup"
  purpose     = "jenkins"
  env         = local.env
  description = "Jenkins Dev Security Group"
  vpc_id      = module.vpc.id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = local.common_tags
}

module "db_dev_sg" {
  source      = "../../modules/network/securitygroup"
  purpose     = "db"
  env         = local.env
  description = "DB Dev Security Group"
  vpc_id      = module.vpc.id

  ingress_rules = [
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      source_security_group_id = module.was_dev_sg.id
    },
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      source_security_group_id = module.bastion_dev_sg.id
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = local.common_tags
}

# ============= Elastic Ip ===============

module "eip_jenkins" {
  source = "../../modules/network/elasticip"

  domain = "vpc"
  tags   = local.common_tags
}

module "eip_was" {
  source = "../../modules/network/elasticip"

  domain = "vpc"
  tags   = local.common_tags
}

# ============= Subnet ===============
module "private_subnet_1" {
  source = "../../modules/network/subnet"

  vpc_id            = module.vpc.id
  cidr_block        = "10.0.3.0/25"
  availability_zone = "ap-northeast-2a"
  access_level      = "private"
  index             = 1
  route_table_id    = module.private_route_table.id
  tags              = local.common_tags
}

module "private_subnet_2" {
  source = "../../modules/network/subnet"

  vpc_id            = module.vpc.id
  cidr_block        = "10.0.4.0/25"
  availability_zone = "ap-northeast-2c"
  access_level      = "private"
  index             = 2
  route_table_id    = module.private_route_table.id
  tags              = local.common_tags
}

module "public_subnet_1" {
  source = "../../modules/network/subnet"

  vpc_id            = module.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  access_level      = "public"
  index             = 1
  route_table_id    = module.public_route_table.id
  tags              = local.common_tags
}

module "public_subnet_2" {
  source = "../../modules/network/subnet"

  vpc_id            = module.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  access_level      = "public"
  index             = 2
  route_table_id    = module.public_route_table.id
  tags              = local.common_tags
}

