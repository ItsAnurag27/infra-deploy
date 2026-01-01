output "instance_id" {
  value = aws_instance.web.id
}

output "private_ip" {
  value = aws_instance.web.private_ip
}

output "elastic_ip_association" {
  value = aws_eip_association.web.id
}

output "sonarqube_instance_id" {
  value = aws_instance.sonarqube.id
}

output "sonarqube_public_ip" {
  value = aws_instance.sonarqube.public_ip
}

output "sonarqube_private_ip" {
  value = aws_instance.sonarqube.private_ip
}

output "sonarqube_eip_association" {
  value = aws_eip_association.sonarqube.id
}

output "sonarqube_elastic_ip" {
  value = data.aws_eip.sonarqube.public_ip
}
