variable "private_db_subnet_ids" {
  description = "List of private DB subnet IDs"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "Security Group ID for the database instance"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}
