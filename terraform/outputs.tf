output "instance_id" {
  value = aws_instance.app.id
}

output "instance_public_ip" {
  value = aws_instance.app.public_ip
}

output "eip_public_ip" {
  value       = var.create_eip ? aws_eip.app_eip[0].public_ip : null
  description = "Elastic IP (if create_eip=true)"
}

output "public_ip_to_use" {
  value       = var.create_eip ? aws_eip.app_eip[0].public_ip : aws_instance.app.public_ip
  description = "Use this IP to access the app"
}

output "ssh_command" {
  value       = "ssh -i ../multi-env-key.pem ubuntu@${var.create_eip ? aws_eip.app_eip[0].public_ip : aws_instance.app.public_ip}"
  description = "SSH command (assuming the key is placed at repo root: multi-env-key.pem)"
}