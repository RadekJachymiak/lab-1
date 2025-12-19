data "aws_ami" "server_ami" {
  filter {
    name   = "name"
    values = ["ubuntu-linux-apache-${var.server_version}-*"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.server_ami.id
  instance_type = "t3.micro"
  count = var.number_of_servers

  vpc_security_group_ids = [
    aws_security_group.allow_all.id
  ]

  tags = {
    Name = "${var.name_prefix}-app-server-${count.index}"
  }
}

resource "aws_security_group" "allow_all" {
  name = "${var.name_prefix}-public-access"
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

