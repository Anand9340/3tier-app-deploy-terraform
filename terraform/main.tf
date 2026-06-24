module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  vpc_cidr     = "10.0.0.0/16"
}

module "security_groups" {
  source       = "./modules/security_groups"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "rds" {

  source = "./modules/rds"

  project_name = var.project_name

  db_subnets = module.vpc.db_private_subnets

  db_sg_id = module.security_groups.db_sg_id

  db_name = var.db_name

  db_username = var.db_username

  db_password = var.db_password
}

module "alb" {

  source = "./modules/alb"

  project_name = var.project_name

  vpc_id = module.vpc.vpc_id

  public_subnets = module.vpc.public_subnets

  alb_sg_id = module.security_groups.alb_sg_id
}

module "launch_templates" {

  source = "./modules/launch_templates"

  project_name = var.project_name

  web_sg_id = module.security_groups.web_sg_id

  app_sg_id = module.security_groups.app_sg_id

  key_name = var.key_name

  ami_id = var.ami_id
}

module "autoscaling" {

  source = "./modules/autoscaling"

  project_name = var.project_name

  web_launch_template_id = module.launch_templates.web_launch_template_id

  app_launch_template_id = module.launch_templates.app_launch_template_id

  public_subnets = module.vpc.public_subnets

  app_private_subnets = module.vpc.app_private_subnets

  target_group_arn = module.alb.target_group_arn
}
