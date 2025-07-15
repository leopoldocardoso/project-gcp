
data "google_compute_network" "vpc_gke" {
  name = var.vpc_gke
}


data "google_compute_subnetwork" "subnet_gke" {
  name   = var.subnet_gke
  region = var.region
}



