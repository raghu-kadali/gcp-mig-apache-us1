resource "google_compute_instance_group_manager" "apache_mig" {
  name               = "apache-mig"
  zone               = "us-central1-a"
  base_instance_name = "apache"

  version {
    instance_template = google_compute_instance_template.apache_template.id
  }

  target_size = 2

  auto_healing_policies {
    health_check      = google_compute_health_check.apache_hc.id
    initial_delay_sec = 120
  }
}
