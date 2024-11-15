# Define the variable for the target group ARN
variable "target_group_arn" {
  description = "The ARN of the target group"
  type        = string
}

# Jump Server instance
resource "aws_instance" "jump_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_id
  key_name        = var.key_name
  security_groups = [var.jump_server_sg_id]

  tags = merge(var.tags, {
    Name = "sss-jump-server"
  })
}

# PHP App Server 1 instance
resource "aws_instance" "php_app_server_1" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.private_app_subnet_ids[0]
  key_name        = var.key_name
  security_groups = [var.php_app_server_sg_id]

  tags = merge(var.tags, {
    Name = "sss-php-app-server-1"
  })
}

# PHP App Server 2 instance
resource "aws_instance" "php_app_server_2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.private_app_subnet_ids[1]
  key_name        = var.key_name
  security_groups = [var.php_app_server_sg_id]

  tags = merge(var.tags, {
    Name = "sss-php-app-server-2"
  })
}

# Attach PHP App Server 1 to the Load Balancer target group
resource "aws_lb_target_group_attachment" "php_app_server_1_attachment" {
  target_group_arn = var.target_group_arn # Use the target group ARN passed from the root module
  target_id        = aws_instance.php_app_server_1.id
  port             = 80
}

# Attach PHP App Server 2 to the Load Balancer target group
resource "aws_lb_target_group_attachment" "php_app_server_2_attachment" {
  target_group_arn = var.target_group_arn # Use the target group ARN passed from the root module
  target_id        = aws_instance.php_app_server_2.id
  port             = 80
}
