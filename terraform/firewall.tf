resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-ansible-only"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}
