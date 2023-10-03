resource "aws_instance" "elasticsearch" {
  count         = 3
  ami           = var.ami
  instance_type = var.instance_type_elasticsearch
  security_groups = [aws_security_group.ssh_sg.name]
  key_name = aws_key_pair.ssh_key.key_name
}

resource "aws_instance" "kibana" {
  count         = 1
  ami           = var.ami
  instance_type = var.instance_type_kibana
  security_groups = [aws_security_group.ssh_sg.name]
  key_name = aws_key_pair.ssh_key.key_name
}

resource "aws_instance" "fastapi" {
  count         = 1
  ami           = var.ami
  instance_type = var.instance_type_fastapi
  security_groups = [aws_security_group.ssh_sg.name]
  key_name = aws_key_pair.ssh_key.key_name
}

resource "aws_security_group" "ssh_sg" {
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }
}

resource "aws_security_group" "http_sg" {
  ingress {
    from_port   = var.http_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub") # Provide the path to your public key file
}

