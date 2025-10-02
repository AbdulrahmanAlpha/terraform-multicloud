# modules/aws_vm/outputs.tf

# Outputs the primary attributes of the created AWS VM.
output "instance_id" {
  description = "The ID of the created EC2 instance."
  value       = aws_instance.app_server.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.app_server.public_ip
}
