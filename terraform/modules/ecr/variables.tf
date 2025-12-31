variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "cn-web"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "cloudnexus"
}
