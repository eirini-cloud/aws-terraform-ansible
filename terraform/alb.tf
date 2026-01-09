############################################
# DATA SOURCES (subnets only)
############################################

# All public subnets in the existing VPC
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }

  filter {
    name   = "tag:Tier"
    values = ["public"]
  }
}

# Fetch each subnet to read its AZ
data "aws_subnet" "public" {
  for_each = toset(data.aws_subnets.public.ids)
  id       = each.value
}

############################################
# LOCALS
############################################

# Ensure one subnet per Availability Zone
locals {
  alb_subnets_by_az = {
    for subnet_id, subnet in data.aws_subnet.public :
    subnet.availability_zone => subnet_id
  }
}

############################################
# APPLICATION LOAD BALANCER
############################################

resource "aws_lb" "bootcamp_alb" {
  name               = "bootcamp-alb"
  load_balancer_type = "application"
  internal           = false

  subnets = [
    "subnet-043e9c38b79dcbc18",
    "subnet-0ee086656d65855e3"
  ]


  security_groups = [
    data.aws_security_group.alb_sg.id
  ]

  enable_deletion_protection = false

  tags = {
    Name        = "bootcamp-alb"
    Environment = "bootcamp"
    ManagedBy   = "Terraform"
  }
}