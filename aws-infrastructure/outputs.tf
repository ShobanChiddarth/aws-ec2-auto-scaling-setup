output "problematic_webserver_public_ip" {
  value = aws_instance.non_autoscaling_ec2.public_ip
}
