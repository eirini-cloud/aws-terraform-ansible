#################################
# EC2 #1 – Main App Target Group
#################################

resource "aws_lb_target_group" "ec2_1_tg" {
  name     = "bootcamp2-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.existing.id

  health_check {
    path = "/"
  }
  lifecycle {
    ignore_changes = [
      health_check,
      tags,
      tags_all
    ]
  }
}

#################################
# EC2 #2 – App2 Target Group
#################################

resource "aws_lb_target_group" "ec2_2_tg" {
  name     = "bootcamp-webserver2-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.existing.id

  health_check {
    path    = "/app2/index.html"
    matcher = "200"
  }
  lifecycle {
    ignore_changes = [
      health_check,
      tags,
      tags_all
    ]
  }
}