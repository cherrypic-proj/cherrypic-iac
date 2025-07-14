module "bastion_dev" {
  source = "../../modules/compute/ec2"

  ami_id                 ="ami-06af2834df25fe45d" // Bastion backup AMI
  instance_type          = "t2.micro"
  subnet_id              = module.public_subnet_1.id
  vpc_security_group_ids = [module.bastion_dev_sg.id]
  associate_public_ip    = true
  key_name               = "cherrypic-bastion-host-key"

  root_volume_size = 30
  root_volume_type = "gp3"
  purpose          = "bastion-host"
  environment      = ""
  enable_eip       = false
  tags             = local.common_tags
}

module "jenkins_dev" {
  source = "../../modules/compute/ec2"

  ami_id                 = "ami-0385d02bd25d2e5c4" // Jenkins backup AMI
  instance_type          = "t3a.small"
  subnet_id              = module.public_subnet_2.id
  vpc_security_group_ids = [module.jenkins_dev_sg.id]
  associate_public_ip    = true
  key_name               = "cherrypic-jenkins-dev-key"

  root_volume_size = 30
  root_volume_type = "gp2"
  purpose          = "jenkins"
  environment      = local.env

  enable_eip        = true
  eip_allocation_id = module.eip_jenkins.id
  tags              = local.common_tags
}


module "was_dev" {
  source = "../../modules/compute/ec2"

  ami_id                 = "ami-08943a151bd468f4e" // Was backup AMI
  instance_type          = "t2.micro"
  subnet_id              = module.public_subnet_1.id
  vpc_security_group_ids = [module.was_dev_sg.id]
  associate_public_ip    = true
  key_name               = "cherrypic-was-dev-key"

  root_volume_size = 30
  root_volume_type = "gp2"
  purpose          = "was"
  environment      = local.env

  enable_eip        = true
  eip_allocation_id = module.eip_was.id
  tags              = local.common_tags
}

