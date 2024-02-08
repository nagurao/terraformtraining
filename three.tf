provider "aws" {
region= "ap-south-1"
}

resource "aws_instance" "myec2" {
   ami = "ami-06b72b3b2a773be2b"                               #amazon linux ami
   instance_type = "t2.micro"
   key_name = "new-key-day3"                             # Create a keypair in the region # pub key arg.
   vpc_security_group_ids  = [aws_security_group.allow_ssh.id]
   tags= {
   Name= "web-server"
   }

   provisioner "remote-exec" {
     inline = [
       "sudo amazon-linux-extras install -y nginx1.12",
       "sudo systemctl start nginx"
     ]

   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./mykey.pem")    #copy the content of the private keyfile ; create a file in /root/app1 named nvirginia.pem and then paste the content into this file #
     host = self.public_ip
#    host = aws_instance.myec2.public_ip
   }
   }
}

### NOTE - Adding a new security group resource to allow the terraform provisioner from laptop to connect to EC2 Instance via SSH.

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0dc11efa83f232645"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
 ingress {
    description = "SSH into VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

