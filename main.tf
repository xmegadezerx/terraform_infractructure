terraform {
  required_version = ">=1.0"
}

provider "aws" {
  region  = "us-east-1"
}

#creating security group with ssh and http

resource "aws_security_group" "build-server" {
         name = "buildserver"

         ingress {
                 from_port = 22
                 to_port = 22
                 protocol = "ssh"
                 cidr_blocks = ["0.0.0.0/0"]
         }

         ingress {
                 from_port = 22
                 to_port = 22
                 protocol = "tcp"
                 cidr_blocks = ["0.0.0.0/0"]
         }
         
         ingress {
                 from_port = 80
                 to_port = 80
                 protocol = "tcp"
                 cidr_blocks = ["0.0.0.0/0"]
         }

         egress {
                 from_port = 0
                 to_port = 0
                 protocol = "-1"
                 cidr_blocks = ["0.0.0.0/0"]
         }

}

#creating aws_instance
resource "aws_instance" "app_server" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.build-server.name}"]
  key_name = "build-server"
  tags = {
    Name = "build-server"
  }
}