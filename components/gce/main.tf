resource "google_compute_instance" "web-server" {
  name = "togashi-${var.env}-web01"
  machine_type = "n1-standard-1"
  zone = "${var.region}-a"
  tags = ["https-server", "http-server"]

  boot_disk {
    initialize_params {
      image = "gce-uefi-images/centos-7"
    }
  }

  metadata_startup_script = file("${path.module}/httpd_install.sh")

  network_interface {
    subnetwork = "togashi-${var.env}-subnet01"
    access_config {}
  }
}

resource "google_compute_instance" "bastion-server" {
  name = "togashi-${var.env}-bastion01"
  machine_type = "n1-standard-1"
  zone = "${var.region}-a"
  tags = ["bastion-server"]

  boot_disk {
    initialize_params {
      image = "gce-uefi-images/centos-7"
    }
  }

  network_interface {
    subnetwork = "togashi-${var.env}-subnet01"
    access_config {}
  }

  metadata = {
    block-project-ssh-keys = "true"
    ssh-keys = "kenta.togashi:${file("${path.module}/id_rsa.pub")}"
  }
}
