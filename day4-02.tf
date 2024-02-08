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
 instance_type=data.aws_instance.foo.instance_type
  availability_zone= "ap-south-1b"
  tags = {
    Name = "nagu-ec2-with-lock"
  }
}


data "aws_instance" "foo" {
  instance_id = "i-020891ff0f481d9bd"
}

output "values-inst" {
value=data.aws_instance.foo
}
