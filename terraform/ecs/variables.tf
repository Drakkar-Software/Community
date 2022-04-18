variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-2"
}

variable "certificate_arn" {
  type        = string
  description = "SSL certificate ARN for ALB HTTPS endpoints"
  default     = "arn:aws:acm:us-east-2:007561943850:certificate/9a1b8788-a0b0-4dc7-82e4-743267db404c"
}

variable "default_container_image" {
  type        = string
  description = "The default container image to use in container definition"
  default     = "nginxdemos/hello:latest"
}
