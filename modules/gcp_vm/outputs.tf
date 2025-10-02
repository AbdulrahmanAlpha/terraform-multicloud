# modules/gcp_vm/outputs.tf

# Outputs the primary attributes of the created GCP VM.
output "instance_name" {
  description = "The name of the GCP Compute Engine instance."
  value       = google_compute_instance.vm_instance.name
}

output "internal_ip" {
  description = "The internal IP address of the GCP instance."
  value       = google_compute_instance.vm_instance.network_interface.0.network_ip
}
