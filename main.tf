provider "google" {
  /*credentials = file(var.credential.data)*/
  project = var.project
  region = var.region
}

terraform {
  backend "gcs" {
    bucket = "togashi-veri-storage-bucket01"
  }
}

module "vpc" {
  source = "./components/vpc"
  env = var.env
  region = var.region
  cidrs = var.cidrs
}

module "firewall" {
  source = "./components/firewall"
  env = var.env
  src_ips = var.src_ips
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
