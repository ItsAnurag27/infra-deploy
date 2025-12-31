terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc_network" {
  source = "./modules/vpc"

  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  project_name      = var.project_name
}

module "ec2_instance" {
  source = "./modules/ec2"

  instance_type             = var.instance_type
  sonarqube_instance_type   = var.sonarqube_instance_type
  subnet_id                 = module.vpc_network.subnet_id
  security_group_id         = module.vpc_network.security_group_id
  key_pair_name             = var.key_pair_name
  project_name              = var.project_name
  existing_eip_id           = var.existing_eip_id
}

module "ecr_registry" {
  source = "./modules/ecr"

  repository_name = var.repository_name
  project_name    = var.project_name
}
