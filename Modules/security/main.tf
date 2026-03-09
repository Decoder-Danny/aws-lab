resource "aws_security_group" "web-sg" {
    name = "web-server-sg"
    description = "the security group that will allow web traffic to our EC2 instance hosting the web server"
    vpc_id = var.vpc_id

    tags = {
        Name = "Web Server SG"
    }
}

resource "aws_security_group" "alb_sg" {
    name = "application-load-balancer-sg"
    description = "security group for load balancer"
    vpc_id = var.vpc_id

    tags = {
        Name = "Load Balancer SG"
    }
}

# 2. Add an Inbound Rule for HTTP (Port 80)
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "Allow public web traffic"
}

# 3. Add an Inbound Rule for SSH (Port 22)
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "0.0.0.0/0" # In prod, you'd limit this to YOUR IP only
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Allow SSH access"
}

# 3. Add an Outbound Rule (ALLOW EVERYTHING)
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # -1 means 'all protocols'
  description       = "Allow instance to reach the internet"
}