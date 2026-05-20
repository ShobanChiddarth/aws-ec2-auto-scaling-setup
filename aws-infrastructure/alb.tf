resource "aws_alb" "webserver_alb" {
  name = "webserver-alb"
  internal = false
  load_balancer_type = "application"
  subnets = [ aws_subnet.singe_ec2_public_subnet.id ]
  security_groups = [ aws_security_group.default_webserver_security_group.id ]
}
