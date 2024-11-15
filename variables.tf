# variables.tf
variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-2" # You can change this default to your desired region
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}
