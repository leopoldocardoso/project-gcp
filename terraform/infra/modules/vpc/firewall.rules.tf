resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.this.id


  direction     = "INGRESS"
  priority      = 100
  source_ranges = ["179.235.186.249/32"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["ssh-access"]
  depends_on = [
    google_compute_network.this
  ]
}
