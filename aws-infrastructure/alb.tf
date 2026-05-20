resource "aws_alb" "webserver_alb" {
  name = "webserver-alb"
  internal = false
  load_balancer_type = "application"
  subnets = [ aws_subnet.auto_scaling_subnet_1a.id, aws_subnet.auto_scaling_subnet_1b.id ]
  security_groups = [ aws_security_group.default_webserver_security_group.id ]
}
