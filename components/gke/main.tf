resource "google_container_cluster" "primary" {
  name = "togashi-${var.env}-cluster01"
  location = var.region
  initial_node_count = 1
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
