resource "aws_instance" "roboshop-project" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.roboshop.id]


  tags = {
    Name        = "roboshop-project"
    Environment = "dev"
    Owner       = "lokesh"
  }
}

resource "aws_security_group" "roboshop" {
  name        = "roboshop"
  description = "outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "roboshop"
    Project = "roboshop"
    Env     = "dev"
  }

}