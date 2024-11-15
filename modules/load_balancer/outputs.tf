output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_lb.app_lb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.app_lb.dns_name
}

output "alb_security_group_id" {
  description = "The ID of the Security Group for the ALB"
  value       = aws_security_group.alb_sg.id
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.app_target_group.arn
}
