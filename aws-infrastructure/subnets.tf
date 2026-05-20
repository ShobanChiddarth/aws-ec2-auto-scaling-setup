resource "aws_subnet" "singe_ec2_public_subnet" {
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.auto_scaling_demo_vpc.id

    tags = {
      "Name" = "single-ec2-public-subnet"
    }
}

resource "aws_route_table_association" "rt_assoc_single_ec2_subnet_public" {
  subnet_id = aws_subnet.singe_ec2_public_subnet.id
  route_table_id = aws_route_table.auto_scaling_demo_public_rt.id
}

resource "aws_subnet" "auto_scaling_subnet_1a" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id

  tags = {
    "Name" = "auto-scaling-subnet-1a"
  }
}

resource "aws_subnet" "auto_scaling_subnet_1b" {
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id

  tags = {
    "Name" = "auto-scaling-subnet-1b"
  }
}

resource "aws_route_table_association" "sub1a_to_nat" {
  subnet_id = aws_subnet.auto_scaling_subnet_1a.id
  route_table_id = aws_route_table.private_to_nat_gw.id
}

resource "aws_route_table_association" "sub1b_to_nat" {
  subnet_id = aws_subnet.auto_scaling_subnet_1b.id
  route_table_id = aws_route_table.private_to_nat_gw.id
}


resource "aws_subnet" "autoscaling_publicsub_1a" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id
}

resource "aws_subnet" "autoscaling_publicsub_1b" {
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.4.0/24"
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id
}

resource "aws_route_table_association" "publicsub1a_to_igw" {
  subnet_id = aws_subnet.autoscaling_publicsub_1a.id
  route_table_id = aws_route_table.auto_scaling_demo_public_rt.id
}

resource "aws_route_table_association" "publicsub1b_to_igw" {
  subnet_id = aws_subnet.autoscaling_publicsub_1b.id
  route_table_id = aws_route_table.auto_scaling_demo_public_rt.id
}
