# VPC module
module "vpc" {
  source                   = "./modules/vpc"
  vpc_cidr_block           = "10.0.0.0/16"
  public_subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_app_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  private_db_subnet_cidrs  = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
  region                   = var.region
  tags = {
    Created_BY = "Sastha"
    Project    = "Sastha-3-tier"
  }
}

# Security Groups module
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  tags = {
    Created_BY = "Sastha"
    Project    = "Sastha-3-tier"
  }
}

# EC2 Instances module
module "ec2_instances" {
  source                 = "./modules/ec2"
  public_subnet_id       = module.vpc.public_subnet_ids[0]   # Public subnet for Jump Server
  private_app_subnet_ids = module.vpc.private_app_subnet_ids # Private subnets for PHP app servers

  ami_id        = "ami-09caa684bdee947fc"
  instance_type = "t2.micro"
  key_name      = "sss-keypair"

  jump_server_sg_id    = module.security_groups.jump_server_sg_id
  php_app_server_sg_id = module.security_groups.php_app_server_sg_id

  # Pass the target group ARN from the load_balancer module
  target_group_arn = module.load_balancer.target_group_arn

  tags = {
    Created_BY = "Sastha"
    Project    = "Sastha-3-tier"
  }
}

# Load Balancer module
module "load_balancer" {
  source            = "./modules/load_balancer"
  vpc_id            = module.vpc.vpc_id                # VPC ID from the VPC module
  alb_sg_id         = module.security_groups.alb_sg_id # ALB Security Group ID from the security_groups module
  public_subnet_ids = module.vpc.public_subnet_ids     # Public Subnets for ALB
  tags = {
    Created_BY = "Sastha"
    Project    = "Sastha-3-tier"
  }
}

# RDS module
module "rds" {
  source                = "./modules/rds"
  private_db_subnet_ids = module.vpc.private_db_subnet_ids
  db_security_group_id  = module.security_groups.rds_sg_id

  db_username = var.db_username
  db_password = var.db_password

  tags = {
    Created_BY = "Sastha"
    Project    = "Sastha-3-tier"
  }
}
