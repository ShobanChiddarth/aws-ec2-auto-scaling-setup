resource "aws_subnet" "singe-ec2-public-subnet" {
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.auto_scaling_demo_vpc.id

    tags = {
      "Name" = "single-ec2-public-subnet"
    }
}

resource "aws_route_table_association" "rt-assoc-single-ec2-subnet-public" {
  subnet_id = aws_subnet.singe-ec2-public-subnet.id
  route_table_id = aws_route_table.auto-scaling-demo-public-rt.id
}
