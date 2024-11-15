variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "alb_sg_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
