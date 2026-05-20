output "problematic_webserver_public_ip" {
  value = aws_instance.non_autoscaling_ec2.public_ip
}

output "autoscaling_alb_dns_name" {
  value = aws_alb.webserver_alb.dns_name
}
