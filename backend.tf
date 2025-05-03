terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket-group-3"
    key            = "group-3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-group-3"
  }
}