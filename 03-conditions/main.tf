resource "aws_instance" "roboshop-project" {
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? "t3.micro" : "t3.large"
  vpc_security_group_ids = [aws_security_group.roboshop.id]


  tags = var.ec2_tags
}
resource "aws_security_group" "roboshop" {
  name        = var.sg_name
  description = "outbound traffic"

  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  tags = var.sg_tags
}