provider "aws" {
region="ap-south-1"
}


data "aws_ami" "app_ami" {
  owners = ["amazon"]
  most_recent      = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2" {
  ami                     = data.aws_ami.app_ami.id 
 instance_type="t2.micro"
  availability_zone= "ap-south-1b"
  tags = {
    Name = "raman-ec2"
  }
}
