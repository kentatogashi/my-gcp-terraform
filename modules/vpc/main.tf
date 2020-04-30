resource "google_compute_network" "vpc" {
  name = var.vpc_name.data
  auto_create_subnetworks = false
}

