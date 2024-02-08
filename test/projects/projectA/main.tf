provider "aws" {
region="ap-south-1"
}

module "ec2module" {
source="/root/test/modules/ec2"
type="t3.medium"
name="ec2-proja-server"
}

module "s3module" {
source="/root/test/modules/storage"
s3bucketname="proja-nagu-storage"
}

