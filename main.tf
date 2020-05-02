provider "google" {
  /*credentials = file(var.credential.data)*/
  project = var.project
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  env = var.env
  region = var.region
  cidrs = var.cidrs
}

module "storage" {
  source = "./modules/storage"
  env = var.env
  region = var.region
}
