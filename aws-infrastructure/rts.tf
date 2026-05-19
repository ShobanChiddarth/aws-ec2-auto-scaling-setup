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
