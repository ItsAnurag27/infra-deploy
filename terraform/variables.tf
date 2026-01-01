variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "cloudnexus"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_pair_name" {
  type = string
}

variable "existing_eip_id" {
  type        = string
  description = "Allocation ID of existing Elastic IP (e.g., eipalloc-0123456789abcdef0)"
}

variable "repository_name" {
  type        = string
  default     = "cn-web"
  description = "ECR repository name"
}

variable "sonarqube_instance_type" {
  type        = string
  default     = "t3.small"
  description = "Instance type for SonarQube server"
}

variable "sonarqube_eip_id" {
  type        = string
  description = "Allocation ID of Elastic IP for SonarQube instance (e.g., eipalloc-0123456789abcdef0)"
}
