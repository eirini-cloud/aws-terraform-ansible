data "aws_instances" "web_servers" {
  filter {
    name   = "tag:Name"
    values = ["bootcamp-webserver*", "app*"]
  }
}