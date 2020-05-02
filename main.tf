provider "google" {
  /*credentials = file(var.credential.data)*/
  project = var.project
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

