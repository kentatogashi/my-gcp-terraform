resource "google_compute_firewall" "allow_ssh" {
  name = "togashi-${var.env}-firewall-allow-ssh"
  network = "togashi-${var.env}-vpc01"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  target_tags = ["bastion-server"]
  source_ranges = var.src_ips
}

resource "google_compute_firewall" "allow-http" {
  name = "togashi-${var.env}-firewall-allow-http"
  network = "togashi-${var.env}-vpc01"

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  target_tags = ["http-server"]
  source_tags = ["bastion-server"]
}
