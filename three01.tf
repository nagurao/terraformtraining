provider "aws" {
  region     = var.region
  
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0cf10cdf9fcd62d37"
    "us-east-2" = "ami-0cf7b2f456cd5efd4"
    "ap-south-1" = "ami-06b72b3b2a773be2b"
  }
}


resource "aws_instance" "app-dev" {
   ami = lookup(var.ami,var.region)  #in terraform console: lookup({us-east-1="ami1",us-east-2="ami2",ap-south-1="ami3"},"ap-south-1","NA") #
   instance_type = "t2.micro"
   count = 2

   tags = {
     Name = element(var.tags,count.index)    # element(["firstec2","secondec2"],1) #
   }
}


output "timestamp" {
  value = local.time
}
