# variables.tf
variable "vpc_id" {
  description = "The ID of the VPC where the security groups will be created."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the security groups"
  type        = map(string)
  default = {
    Created_BY = "Sastha"
    Project    = "Sastha-3-tier"
  }
}
