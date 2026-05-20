resource "aws_eip" "nat_gateway_elastic_ip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "autoscaling_nat_gateway" {
  allocation_id = aws_eip.nat_gateway_elastic_ip.id
  subnet_id = aws_subnet.singe_ec2_public_subnet.id

  tags = {
    "Name" = "nat-gateway"
  }
}
