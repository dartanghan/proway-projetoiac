
output "private_key_pem" {
  value     = tls_private_key.lb_ssh_key.private_key_pem
}

output "public_ip" {
  value = aws_instance.backend_ec2.public_ip
}