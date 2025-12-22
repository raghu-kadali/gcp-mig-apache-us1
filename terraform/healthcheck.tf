resource "google_compute_health_check" "apache_hc" {
  name = "apache-hc1"

  http_health_check {
    port = 80
  }
}
