resource "aws_vpc" "demo_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tendency

  tags = {
    Name    = "${var.project_name}-VPC-${var.env}"
    Env     = var.env
    Project = var.project_name
  }
}




resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.demo_vpc.id # interpolation
  cidr_block        = var.subnet_cidr
  availability_zone = var.azs
}
