data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = ["bootcamp-vpc-vpc"]
  }
}

data "aws_subnets" "alb" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }

  filter {
    name   = "tag:Tier"
    values = ["public"]
  }
}