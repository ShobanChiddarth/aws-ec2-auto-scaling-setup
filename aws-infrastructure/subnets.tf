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

resource "aws_subnet" "auto-scaling-subnet-1a" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id

  tags = {
    "Name" = "auto-scaling-subnet-1a"
  }
}

resource "aws_subnet" "auto-scaling-subnet-1b" {
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id

  tags = {
    "Name" = "auto-scaling-subnet-1b"
  }
}

resource "aws_route_table_association" "1a-to-nat" {
  subnet_id = aws_subnet.auto-scaling-subnet-1a.id
  route_table_id = aws_route_table.private_to_nat_gw.id
}

resource "aws_route_table_association" "1b-to-nat" {
  subnet_id = aws_subnet.auto-scaling-subnet-1b.id
  route_table_id = aws_route_table.private_to_nat_gw.id
}
