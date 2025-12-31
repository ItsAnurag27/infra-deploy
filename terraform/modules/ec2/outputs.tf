output "instance_id" {
  value = aws_instance.web.id
}

output "private_ip" {
  value = aws_instance.web.private_ip
}

output "elastic_ip_association" {
  value = aws_eip_association.web.id
}
