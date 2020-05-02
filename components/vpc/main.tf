resource "google_compute_network" "vpc" {
  name = "togashi-${var.env}-vpc01"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  name = format("togashi-${var.env}-subnet%02d", count.index + 1)
  count = length(var.cidrs)
  ip_cidr_range = element(var.cidrs, count.index)
  region = var.region
  network = google_compute_network.vpc.self_link
}
