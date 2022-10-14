resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.dev_vpc.id # interpolation
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(data.aws_availability_zones.subnet_azs.names, count.index)

  tags = {
    Name    = "${var.private_subnet_names}-${count.index + 1}"
    Env     = var.env
    Project = var.project_name
  }
}

resource "aws_eip" "eip" {
  vpc = true
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet.*.id[0]

  tags = {
    Name = "${var.project_name}-NAT"
  }
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.project_name}-Private-RT"
  }
}


resource "aws_route_table_association" "private_rt_acc" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}
