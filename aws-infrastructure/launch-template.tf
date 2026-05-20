locals {
  webserver_autoscaling_init = <<-EOF
  #!/bin/bash
  apt-get update
  apt-get upgrade -y
  apt-get install nginx -y
  systemctl enable --now nginx
  echo "<html><body><h1>This is auto scaling server</h1></body></html>" > /var/www/html/index.html
EOF
}

resource "aws_launch_template" "webserver_launch_template" {
  image_id = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = aws_key_pair.webserver_public_key.key_name
  vpc_security_group_ids = [ aws_security_group.default_webserver_security_group.id ]
  user_data = base64encode(local.webserver_autoscaling_init)
  update_default_version = true

  tags = {
    "Name" = "webserver-launch-template"
  }
}
