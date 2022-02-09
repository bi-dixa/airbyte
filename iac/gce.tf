resource "google_compute_instance" "airbyte" {
  name         = "airbyte"
  machine_type = "e2-medium"

  tags = ["airbyte"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 40
    }
  }

  network_interface {
    network = "default"
    access_config {
      network_tier = "PREMIUM"
    }
  }

  metadata_startup_script = file("${path.module}/init_scripts/airbyte.sh")

  service_account {
    email  = google_service_account.airbyte-service-account.email
    scopes = ["cloud-platform"]
  }
}
