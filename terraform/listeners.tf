#################################
# HTTP Listener – Redirect Only #
#################################

resource "aws_lb_listener" "http_redirect" {
  load_balancer_arn = aws_lb.bootcamp_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
      host        = "#{host}"
      path        = "/#{path}"
      query       = "#{query}"
    }
  }
}

#################################
# HTTPS Listener – Forward Only #
#################################

resource "aws_lb_listener" "https_forward" {
  load_balancer_arn = aws_lb.bootcamp_alb.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-Res-PQ-2025-09"
  certificate_arn = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2_1_tg.arn
  }
}