variable "region_name" {
  default = "us-west-2"
}


variable "vpc_name" {
  default = "DEV-VPC"
}

variable "vpc_cidr" {
  default = "10.80.0.0/16"
}

variable "vpc_tendency" {
  default = "default"
}

variable "env" {
  default = "DEV"
}

variable "project_name" {
  type    = string
  default = "SSE-PROJECT"
}


variable "public_subnet_cidr" {
  type    = list(string)
  default = ["10.80.0.0/25", "10.80.0.128/25", "10.80.1.0/25", "10.80.1.128/25"]
}

variable "private_subnet_cidr" {
  type    = list(string)
  default = ["10.80.2.0/25", "10.80.2.128/25", "10.80.3.0/25", "10.80.3.128/25"]
}

# variable "subnet_azs" {
#   type    = list(string)
#   default = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
# }

data "aws_availability_zones" "subnet_azs" {}


variable "public_subnet_names" {
  default = "DEV-PUBLIC-SUBNET"
}
variable "private_subnet_names" {
  default = "DEV-PRIVATE-SUBNET"
}


# variable "ami_id" {
#   default = "ami-08e2d37b6a0129927"
# }


variable "ami_id" {
  type = map(string)
  default = {
    "us-east-1"  = "ami-026b57f3c383c2eec"
    "us-west-2"  = "ami-08e2d37b6a0129927"
    "ap-south-1" = "ami-01216e7612243e0ef"
  }
}



variable "instance_type" {
  default = "t2.micro"
}
