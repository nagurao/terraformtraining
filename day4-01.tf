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
    Name = "raman-ec2"
  }
}


data "aws_instance" "foo" {
  instance_id = "i-05d51c6a4c400bddb"
}

#output "values-inst" {
#value=data.aws_instance.foo
}
