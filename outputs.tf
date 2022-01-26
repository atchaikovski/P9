output "database_server_ip" {
  value = aws_eip.database_static_ip.public_ip
}

output "worker_server_ip" {
  value = aws_eip.docker_static_ip.*.public_ip
}
