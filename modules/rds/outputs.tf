output "db_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.db_instance.endpoint
}

output "db_subnet_group" {
  description = "RDS Subnet Group Name"
  value       = aws_db_subnet_group.db_subnet_group.name
}
