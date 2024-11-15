output "jump_server_sg_id" {
  value = aws_security_group.jump_server_sg.id
}

output "php_app_server_sg_id" {
  value = aws_security_group.php_app_server_sg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

# Use a for loop to collect the security group IDs into a list
output "sg_ids" {
  value = [
    aws_security_group.jump_server_sg.id,
    aws_security_group.php_app_server_sg.id,
    aws_security_group.alb_sg.id,
    aws_security_group.rds_sg.id
  ]
}
