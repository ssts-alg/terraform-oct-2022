output "public_server_public_ip" {
  value = aws_instance.public-ec2.public_ip
}

output "public_server_private_ip" {
  value = aws_instance.public-ec2.private_ip
}

output "private_server_private_ip" {
  value = aws_instance.private-ec2.private_ip
}

output "vpc_id" {
  value = aws_vpc.dev_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet.*.id
}
output "private_subnet_ids" {
  value = aws_subnet.private_subnet.*.id
}
