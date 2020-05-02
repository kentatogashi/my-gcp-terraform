resource "google_compute_network" "vpc" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "togashi-veri-subnet01" {
  name = "togashi-veri-subnet01"
  ip_cidr_range = "192.168.10.0/24"
  region = var.region
  network = google_compute_network.vpc.self_link
}

resource "google_compute_subnetwork" "togashi-veri-subnet02" {
  name = "togashi-veri-subnet02"
  ip_cidr_range = "192.168.20.0/24"
  region = var.region
  network = google_compute_network.vpc.self_link
}

resource "google_compute_subnetwork" "togashi-veri-subnet03" {
  name = "togashi-veri-subnet03"
  ip_cidr_range = "192.168.30.0/24"
  region = var.region
  network = google_compute_network.vpc.self_link
}
