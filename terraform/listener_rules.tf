
#################################
# /app2 → App2
#################################

resource "aws_lb_listener_rule" "app2_forward" {
  listener_arn = aws_lb_listener.https_forward.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["/app2*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2_2_tg.arn
  }
}




