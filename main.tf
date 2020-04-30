provider "google" {
  credentials = file(var.credential.data)
  project = lookup(var.project_name, "data")
  region = "asia-northeast1"
}

module "vpc" {
  source = "./modules/vpc"
}

