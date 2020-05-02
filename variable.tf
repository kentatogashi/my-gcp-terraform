variable "credential" {
  default = {
    data = "credential.json"
  }
}

variable "project" {
  default = "my-project"
}

variable "env" {}
variable "region" {}
variable "cidrs" {}
