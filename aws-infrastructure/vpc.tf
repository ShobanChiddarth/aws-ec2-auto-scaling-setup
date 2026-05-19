resource "aws_vpc" "auto_scaling_demo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "auto-scaling-demo-vpc"
  }
}

resource "aws_internet_gateway" "auto_scaling_igw" {
  vpc_id = aws_vpc.auto_scaling_demo_vpc.id

  tags = {
    "Name" = "auto-scaling-igw"
  }
}
