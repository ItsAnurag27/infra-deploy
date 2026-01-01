output "vpc_id" {
  value = module.vpc_network.vpc_id
}

output "subnet_id" {
  value = module.vpc_network.subnet_id
}

output "security_group_id" {
  value = module.vpc_network.security_group_id
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "elastic_ip_association" {
  value       = module.ec2_instance.elastic_ip_association
  description = "Access your app at http://52.45.161.179:5173"
}

output "ssh_command" {
  value = "ssh -i <your-key.pem> ubuntu@52.45.161.179"
}

output "ecr_repository_url" {
  value       = module.ecr_registry.repository_url
  description = "ECR repository URL for Docker images"
}

output "sonarqube_instance_id" {
  value       = module.ec2_instance.sonarqube_instance_id
  description = "SonarQube EC2 instance ID"
}

output "sonarqube_elastic_ip" {
  value       = module.ec2_instance.sonarqube_elastic_ip
  description = "SonarQube Elastic IP address"
}

output "sonarqube_access" {
  value       = "http://${module.ec2_instance.sonarqube_elastic_ip}:9000"
  description = "SonarQube access URL"
}

output "ecr_registry_id" {
  value       = module.ecr_registry.registry_id
  description = "AWS Account ID for ECR"
}
