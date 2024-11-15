resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for the Application Load Balancer"
  vpc_id      = var.vpc_id # Use the passed VPC ID

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to the world for HTTP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags # Use the passed tags
}

resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]       # ALB Security Group passed from root module
  subnets            = var.public_subnet_ids # Use the passed public subnets for ALB

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true

  tags = var.tags # Use the passed tags
}

resource "aws_lb_target_group" "app_target_group" {
  name     = "app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id # Use the passed VPC ID

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
    healthy_threshold   = 2
  }
  slow_start = 30       # Optional: Gradually increase traffic to new instances
  tags       = var.tags # Use the passed tags
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }
}
