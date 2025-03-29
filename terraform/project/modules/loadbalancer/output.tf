
output "private_key_pem" {
  value     = tls_private_key.lb_ssh_key.private_key_pem
  sensitive = true
}