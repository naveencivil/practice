provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
ami = "ami-0cf10cdf9fcd62d37"
instance_type = "t2.micro"
key_name = "n.v"
vpc_security_group_ids = [aws_security_group.five.id]
availability_zone = "us-east-1"

tags = {
Name = "naveen-1"
}
}


resource "aws_security_group" "five" {
  name = "elb-kn"
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
