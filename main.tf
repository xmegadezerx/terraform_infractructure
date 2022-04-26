terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "build-server2" {
  name = "build-server2"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

#creating aws_instance
resource "aws_instance" "app_server" {
  ami             = "ami-0e472ba40eb589f49"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.build-server2.name}"]
  key_name        = "build-server"
  tags = {
    Name = "build-server"
  }
}