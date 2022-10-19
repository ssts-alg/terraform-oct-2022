resource "aws_instance" "private-ec2" {
  ami                         = var.ami_id[var.region_name]
  instance_type               = var.instance_type
  key_name                    = "terraformkey"
  subnet_id                   = aws_subnet.private_subnet.*.id[0]
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]


  tags = {
    Name = "${var.project_name}-private-ec2"
  }
}
