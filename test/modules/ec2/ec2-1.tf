provider "aws" {
region= "ap-south-1"
}

resource "aws_instance" "myec2" {
   ami = "ami-06b72b3b2a773be2b"
   instance_type = "t2.micro"
   tags={
   Name="nagu-mod-ec2"
   }
}

