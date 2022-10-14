resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.dev_vpc.id # interpolation
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(data.aws_availability_zones.subnet_azs.names, count.index)

  tags = {
    Name    = "${var.public_subnet_names}-${count.index + 1}"
    Env     = var.env
    Project = var.project_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name    = "${var.project_name}-igw"
    Env     = var.env
    Project = var.project_name
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-Pubilc-RT"
  }
}


resource "aws_route_table_association" "public_rt_acc" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}
