output "vpc_id" {
  value       = data.aws_vpc.existing.id
  description = "Bootcamp VPC ID"
}

output "public_subnet_ids" {
  description = "Public subnet IDs used by the ALB"
  value       = data.aws_subnets.public.ids
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.bootcamp_alb.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.bootcamp_alb.arn
}

output "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer (for Route53 alias records)"
  value       = aws_lb.bootcamp_alb.zone_id
}

output "ec2_instance_ids" {
  value       = data.aws_instances.web_servers.ids
  description = "Discovered EC2 instance IDs"
}

