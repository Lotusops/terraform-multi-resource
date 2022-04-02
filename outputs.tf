output "public_ip_instance_1" {
  value = aws_instance.instance1.public_ip
}

output "public_ip_instance_2" {
  value = aws_instance.instance2.public_ip
}