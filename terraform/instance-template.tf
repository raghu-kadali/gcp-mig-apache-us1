resource "google_compute_instance_template" "apache_template" {
  name_prefix  = "apache-template-"
  machine_type = "e2-medium"

  disk {
    source_image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
    boot         = true
    auto_delete  = true
  }

  network_interface {
    network = data.google_compute_network.default.name
    access_config {}
  }

  # ❌ NO startup script
}
