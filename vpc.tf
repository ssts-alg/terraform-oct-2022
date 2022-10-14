resource "aws_vpc" "dev_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tendency

  tags = {
    Name    = var.vpc_name
    Env     = var.env
    Project = var.project_name
  }
}
