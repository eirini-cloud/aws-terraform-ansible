terraform {
  backend "s3" {
    bucket         = "eirini-terraform-state-eu-north-1"
    key            = "aws-terraform-ansible/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
