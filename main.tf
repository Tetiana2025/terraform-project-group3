provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source    = "./modules/vpc"
  vpc_cidr  = var.vpc_cidr
}

module "sg" {
  source     = "./modules/sg"
  vpc_id     = module.vpc.vpc_id
  bastion_cidr = var.bastion_cidr
}

module "ec2" {
  source       = "./modules/ec2"
  subnet_id    = module.vpc.public_subnet_ids[0]
  sg_id        = module.sg.sg_id
  key_name     = var.key_name
  instance_type = var.instance_type
}

module "rds" {
  source        = "./modules/rds"
  db_name       = var.db_name
  db_user       = var.db_user
  db_password   = var.db_password
  subnet_ids    = module.vpc.public_subnet_ids
  sg_id         = module.sg.sg_id
}
resource "aws_security_group" "group" {
  name        = "group-3"
  description = "Allow SSH and MySQL access"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "group-3-security-group"
  }
}

resource "aws_key_pair" "group3_key" {
  key_name   = "group3-key"
  public_key = file(var.public_key_path)
}