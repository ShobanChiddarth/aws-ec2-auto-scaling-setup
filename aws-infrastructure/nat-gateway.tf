resource "aws_eip" "nat-gateway-elastic-ip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "autoscaling_nat_gateway" {
  allocation_id = aws_eip.nat-gateway-elastic-ip.id
  subnet_id = aws_subnet.singe-ec2-public-subnet.id

  tags = {
    "Name" = "nat-gateway"
  }
}
