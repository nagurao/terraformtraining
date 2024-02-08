terraform {
  backend "s3" {
    bucket = "nagu-terraform-training-bucket-statefile"
    key="terraform/state"
    region="ap-south-1"
    dynamodb_table="tflock"
    }
}

