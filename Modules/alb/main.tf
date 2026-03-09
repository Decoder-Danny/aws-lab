resource "aws_alb" "webserver_alb" {
    name = "Web Server Load Balancer"
    internal = false
    load_balancer_type = var.load_balancer_type
}