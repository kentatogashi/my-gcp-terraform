resource "google_storage_bucket" "bucket" {
  name = "togashi-${var.env}-storage-bucket01"
  location = var.region
  storage_class = "REGIONAL"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}
