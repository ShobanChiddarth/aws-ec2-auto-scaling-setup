resource "aws_lb_target_group" "webservers_tg" {
  name = "webservers-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id
  
}