output "backend_ip" {
    value = module.backend.public_ip
}

output "backend_privkey" {
  value     = module.backend.private_key_pem
}

output "loadbalancer_ip" {
    value = module.loadbalancer.public_ip
}

output "loadbalancer_privkey" {
  value     = module.loadbalancer.private_key_pem
}