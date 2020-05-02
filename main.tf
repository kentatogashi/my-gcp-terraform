provider "google" {
  /*credentials = file(var.credential.data)*/
  project = var.project
  region = var.region
}

module "vpc" {
  source = "./components/vpc"
  env = var.env
  region = var.region
  cidrs = var.cidrs
}

module "storage" {
  source = "./components/storage"
  env = var.env
  region = var.region
}

module "gce" {
  source = "./components/gce"
  env = var.env
  region = var.region
}
