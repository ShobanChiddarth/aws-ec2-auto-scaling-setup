resource "aws_security_group" "default_webserver_security_group" {
  name = "default_webserver_security_group"
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id
  description = "allow all"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
