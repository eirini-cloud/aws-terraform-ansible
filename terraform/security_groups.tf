data "aws_security_group" "alb_sg" {
  filter {
    name   = "group-name"
    values = ["alb-sg"]
  }

  vpc_id = data.aws_vpc.existing.id
}

data "aws_security_group" "web_sg" {
  filter {
    name   = "group-name"
    values = ["public-web-sg"]
  }

  vpc_id = data.aws_vpc.existing.id
}

resource "aws_security_group_rule" "alb_to_web_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"

  security_group_id        = data.aws_security_group.web_sg.id
  source_security_group_id = data.aws_security_group.alb_sg.id

  description = "Allow ALB to reach web servers on HTTP"
}
