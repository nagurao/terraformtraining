provider "aws" {
region = "ap-south-1"
}

resource "aws_security_group" "security_g" {
  name = "6thsecg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = "vpc-0dc11efa83f232645"

  tags = {
    Name = "allow_tls"
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"
    cidr_blocks = [var.mycidr]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [var.mycidr]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = [var.mycidr]
  }
}


resource "aws_instance" "ec2" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t3.medium"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "nagu-tf-ec2"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-south-1b"
  size              = 10

  tags = {
    Name = "HelloWorldjpmc"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.ec2.id
}



output "myservers-publicip" {
value=[aws_instance.ec2.public_ip]
}

output "myservers-arn" {
value=[aws_instance.ec2.arn]
}

output "myservers-instance-type" {
value=[aws_instance.ec2.instance_type]
}

output "myservers-ami" {
value=[aws_instance.ec2.ami]
}



