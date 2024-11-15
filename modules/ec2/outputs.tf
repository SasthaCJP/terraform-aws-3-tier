output "jump_server_public_ip" {
  description = "Public IP of the Jump Server"
  value       = aws_instance.jump_server.public_ip
}

output "php_app_server_1_private_ip" {
  description = "Private IP of PHP App Server 1"
  value       = aws_instance.php_app_server_1.private_ip
}

output "php_app_server_2_private_ip" {
  description = "Private IP of PHP App Server 2"
  value       = aws_instance.php_app_server_2.private_ip
}
