resource "aws_eip" "nat_gateway_elastic_ip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "autoscaling_nat_gateway" {
  allocation_id = aws_eip.nat_gateway_elastic_ip.id
  subnet_id = aws_subnet.autoscaling_publicsub_1a.id

  tags = {
    "Name" = "nat-gateway"
  }
}
