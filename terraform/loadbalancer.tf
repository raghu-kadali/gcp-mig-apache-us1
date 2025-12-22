resource "google_compute_backend_service" "apache_backend" {
  name          = "apache-backend"
  protocol      = "HTTP"
  port_name     = "http"
  health_checks = [google_compute_health_check.apache_hc.id]

  backend {
    group = google_compute_instance_group_manager.apache_mig.instance_group
  }
}

resource "google_compute_url_map" "apache_map" {
  name            = "apache-map"
  default_service = google_compute_backend_service.apache_backend.id
}

resource "google_compute_target_http_proxy" "apache_proxy" {
  name    = "apache-proxy"
  url_map = google_compute_url_map.apache_map.id
}

resource "google_compute_global_forwarding_rule" "apache_fw" {
  name       = "apache-fw"
  target     = google_compute_target_http_proxy.apache_proxy.id
  port_range = "80"
}
