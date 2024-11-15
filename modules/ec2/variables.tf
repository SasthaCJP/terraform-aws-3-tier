variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID for the jump server (public subnet)"
  type        = string
}

variable "private_app_subnet_ids" {
  description = "List of subnet IDs for PHP app servers (private subnets)"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
}

variable "jump_server_sg_id" {
  description = "Security group ID for the jump server"
  type        = string
}

variable "php_app_server_sg_id" {
  description = "Security group ID for the PHP app servers"
  type        = string
}

variable "tags" {
  description = "Tags to apply to EC2 instances"
  type        = map(string)
  default     = {}
}
