output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "app_ec2_elastic_ip" {
  value       = module.ec2_instance.public_ip
  description = "App EC2 Public IP address"
}

output "app_ec2_private_ip" {
  value       = module.ec2_instance.private_ip
  description = "App EC2 Private IP address"
}

output "sonarqube_instance_id" {
  value       = module.ec2_instance.sonarqube_instance_id
  description = "SonarQube EC2 instance ID"
}

output "sonarqube_ec2_elastic_ip" {
  value       = module.ec2_instance.sonarqube_public_ip
  description = "SonarQube EC2 Public IP address"
}

output "sonarqube_ec2_private_ip" {
  value       = module.ec2_instance.sonarqube_private_ip
  description = "SonarQube EC2 Private IP address"
}

output "ecr_repository_url" {
  value       = module.ecr_registry.repository_url
  description = "ECR repository URL for Docker images"
}

output "ecr_registry_id" {
  value       = module.ecr_registry.registry_id
  description = "AWS Account ID for ECR"
}
