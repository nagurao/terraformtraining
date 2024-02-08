provider "aws" {
region="ap-south-1"
}

module "ec2module" {
source="/root/test/modules/ec2"
type="t3.micro"
#name="ec2-projb-server"
}

module "s3module" {
source="/root/test/modules/storage"
}

