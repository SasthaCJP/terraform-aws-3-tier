output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.sss_vpc.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value = [
    aws_subnet.sss_public_web_subnet_1.id,
    aws_subnet.sss_public_web_subnet_2.id,
    aws_subnet.sss_public_web_subnet_3.id
  ]
}

output "private_app_subnet_ids" {
  description = "List of private application subnet IDs"
  value = [
    aws_subnet.sss_private_app_subnet_1.id,
    aws_subnet.sss_private_app_subnet_2.id,
    aws_subnet.sss_private_app_subnet_3.id
  ]
}

output "private_db_subnet_ids" {
  description = "List of private database subnet IDs"
  value = [
    aws_subnet.sss_private_db_subnet_1.id,
    aws_subnet.sss_private_db_subnet_2.id,
    aws_subnet.sss_private_db_subnet_3.id
  ]
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.sss_igw.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT gateway"
  value       = aws_nat_gateway.sss_nat_gateway.id
}

output "nat_eip" {
  description = "The public IP of the NAT gateway's Elastic IP"
  value       = aws_eip.sss_nat_eip.public_ip
}

# Remove this duplicate output block
# output "private_subnet_ids" {
#   value = aws_subnet.private_app_subnets[*].id
# }

# Remove this duplicate output block
# output "public_subnet_ids" {
#   value = aws_subnet.public_subnets[*].id
# }
