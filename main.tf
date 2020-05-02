provider "google" {
  /*credentials = file(var.credential.data)*/
  project = lookup(var.project_name, "data")
  region = lookup(var.region_name, "data")
}

module "vpc" {
  source = "./modules/vpc"
}

