resource "aws_alb" "webserver_alb" {
  name = "webserver-alb"
  internal = false
  load_balancer_type = "application"
  subnets = [ aws_subnet.autoscaling_publicsub_1a.id, aws_subnet.auto_scaling_subnet_1b.id ]
  security_groups = [ aws_security_group.default_webserver_security_group.id ]
}

resource "aws_lb_listener" "listener_for_alb" {
  load_balancer_arn = aws_alb.webserver_alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.webservers_tg.arn
  }
}
