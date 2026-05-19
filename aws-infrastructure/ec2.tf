locals {
  webserver_init = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get upgrade -y
    apt-get install nginx -y
    echo "<html><body><h1>This is non auto scaling web server</h1></body></html>" > /var/www/html/index.html
EOF

}

resource "aws_instance" "non_autoscaling_ec2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.singe-ec2-public-subnet.id
  associate_public_ip_address = true
  user_data = local.webserver_init
  vpc_security_group_ids = [aws_security_group.default_webserver_security_group.id]
  key_name = aws_key_pair.webserver_public_key.key_name

  tags = {
    Name = "problematic-server"
  }
}
