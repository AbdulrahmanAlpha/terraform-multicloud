# modules/gcp_vm/main.tf

# Creates a single GCP Compute Engine instance.
resource "google_compute_instance" "vm_instance" {
  name         = "${var.prefix}-gcp-vm"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.source_image
    }
  }

  network_interface {
    network = "default" # Use default network for simplicity
    access_config {
      # Ephemeral IP
    }
  }

  metadata = {
    environment = var.environment_name
  }

  labels = var.common_tags
}

# End of main.tf