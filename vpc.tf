resource "aws_vpc" "dev_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tendency

  tags = {
    Name    = var.vpc_name
    Env     = var.env
    Project = var.project_name
  }
}



# resource "aws_vpc" "manual_vpc" {
#   cidr_block       = "10.90.0.0/16"
#   instance_tenancy = var.vpc_tendency
#
#   tags = {
#     Name = "${var.project_name}-sstech"
#   }
# }





# resource "aws_vpc" "prd_vpc" {
#   cidr_block       = var.vpc_cidr
#   instance_tenancy = var.vpc_tendency
#
#   tags = {
#     Name    = "${var.project_name}-vpc"
#     Env     = var.env
#     Project = var.project_name
#   }
# }
