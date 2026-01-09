variable "project_name" {
  description = "Bootcamp project name"
  type        = string
  default     = "eirini-bootcamp"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate used by the ALB HTTPS listener"
  type        = string
}
