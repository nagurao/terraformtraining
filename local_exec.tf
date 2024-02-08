provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami                    = "ami-06b72b3b2a773be2b"
  instance_type          = "t2.micro"
#  key_name               = "new-key-day3"
#  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "web-server"
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "Instance ID: "${aws_instance.myec2.id}"
      echo "Public IP: ${aws_instance.myec2.public_ip}"
      # Add any other local commands you want to execute
    EOT
  }
}
