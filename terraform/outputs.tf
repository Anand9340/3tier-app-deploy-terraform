output "project_name" {
  value = var.project_name
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
