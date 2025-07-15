
data "google_compute_network" "vpc_vms" {
  name = var.vpc_vms
}


data "google_compute_subnetwork" "subnet_vms" {
  name   = var.subnet_vms
  region = var.region
}



