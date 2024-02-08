provider "aws" {
  #version = "4.64.0"
  region = "ap-south-1"
  #access-key = ""
  #secret-key = ""
}

resource "aws_instance" "ec2" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t3.medium"
  tags = {
    Name = "devenv-ec2"
  }
}
