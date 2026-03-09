resource "aws_instance" "webserver" {
    ami = data.aws_ami.amazon_linux_2023.id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.sg_id]

    user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Web Server Operational</h1>" > /var/www/html/index.html
              EOF
              
    tags = {
        Name = "Web Server"
    }
}