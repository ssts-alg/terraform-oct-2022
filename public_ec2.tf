resource "aws_instance" "public-ec2" {
  ami                         = var.ami_id[var.region_name]
  instance_type               = var.instance_type
  key_name                    = "terraformkey"
  subnet_id                   = aws_subnet.public_subnet.*.id[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]


  tags = {
    Name = "${var.project_name}-public-ec2"
  }
}
