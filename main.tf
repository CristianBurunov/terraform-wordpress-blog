terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
  required_version = ">= 0.14.9"
}
provider "aws" {
  region = var.root_region
  # profile    = "default"
  # access_key = var.root_access_key
  # secret_key = var.root_secret_key
}
#..............................VPC...........................

module "vpc" {
  source       = "./modules/vpc"
  vpc_vpc_cidr = var.root_vpc_cidr
  vpc_vpc_name = var.root_vpc_name

  vpc_public_subnets_cidr  = var.root_public_subnets_cidr
  vpc_private_subnets_cidr = var.root_private_subnets_cidr

  vpc_az = var.root_az


  vpc_sg_name        = var.root_sg_name
  vpc_sg_description = var.root_sg_description

  vpc_egress_name     = var.root_egress_name
  vpc_egress_ports    = var.root_egress_ports
  vpc_egress_protocol = var.root_egress_protocol

  vpc_ingress_protocol = var.root_ingress_protocol
  vpc_ingress_ports    = var.root_ingress_ports


  vpc_rt_name       = var.root_rt_name
  vpc_igw_name      = var.root_igw_name
  vpc_rt_cidr_block = var.root_rt_cidr_block

}
#..........................INSTANCE..........................

module "instance" {
  depends_on = [module.vpc, module.rds]
  source            = "./modules/ec2"
  ec2_ami           = var.root_ami
  ec2_instance_type = var.root_instance_type
  ec2_public_subnet = module.vpc.output_public_subnet_id[0]
  ec2_ec2_name      = var.root_ec2_name
  ec2_ec2_sg        = module.vpc.output_sg_ec2
 
  ec2_key_name               = var.root_key_name
  #key_name          = module.ec2.key_name
  # ec2_key = var.root_ec2

  ec2_healthy_threshold   = var.root_healthy_threshold
  ec2_unhealthy_threshold = var.root_unhealthy_threshold
  ec2_timeout             = var.root_timeout
  ec2_interval            = var.root_interval
  ec2_vpc_id              = module.vpc.output_vpc_id
  ec2_public              = module.vpc.output_public_subnet_id
  ec2_load_balancer_type  = var.root_load_balancer_type

  database_endpoint = module.rds.rds_endpoint
  volume_size       = var.root_volume_size
  volume_type       = var.root_volume_type
  database_password = var.root_db_password
  database_name = var.root_db_name
  database_user = var.root_db_username
}

module "rds" {
  depends_on =[module.vpc]
  source = "./modules/rds"
  # db_db_parameter_group_name = var.root_db_parameter_group_name
  db_db_subnet_group   = var.root_db_subnet_group
  db_db_password       = var.root_db_password
  db_db_username       = var.root_db_username
  db_db_name           = var.root_db_name
  db_db_instance_class = var.root_db_instance_class
  db_db_engine_version = var.root_db_engine_version
  db_db_engine         = var.root_db_engine
  db_db_storage        = var.root_db_storage
  db_sg_rds            = module.vpc.output_sg_rds

  db_private_subnet_id  = module.vpc.output_private_subnet_id[*]
  # db_private_subnet_id2 = module.vpc.output_private_subnet_id2
}
 