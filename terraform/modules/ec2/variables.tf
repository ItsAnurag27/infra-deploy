variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "existing_eip_id" {
  type        = string
  description = "Allocation ID of existing Elastic IP to associate with instance"
}

variable "sonarqube_instance_type" {
  type        = string
  default     = "t3.small"
  description = "Instance type for SonarQube server"
}
