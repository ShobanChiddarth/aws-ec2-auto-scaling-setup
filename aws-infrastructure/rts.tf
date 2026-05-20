# route tables

resource "aws_route_table" "auto-scaling-demo-public-rt" {
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.auto_scaling_igw.id
  }

  tags = {
    "Name" = "auto-scaling-demo-public-rt"
  }
}

resource "aws_route_table" "private_to_nat_gw" {
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.autoscaling_nat_gateway.id
  }

  tags = {
    "Name" = "route to nat gateway"
  }
}
