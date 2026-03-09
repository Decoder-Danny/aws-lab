output "web_server_sg_id" {
  description = "The ID of the security group to be used by the EC2 instance"
  value       = aws_security_group.web-sg.id
}