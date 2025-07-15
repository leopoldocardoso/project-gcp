terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.42.0"
    }
  }

  backend "gcs" {
    bucket = "iacterraformstate"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source     = "./infra/modules/vpc"
  project_id = var.project_id
}

module "gke" {
  source = "./infra/modules/gke"

  project_id = var.project_id
  region     = var.region
  depends_on = [ module.vpc ]
}

module "gcr-artifact" {
  source     = "./infra/modules/gcr-artifact"
}

module "instances" {
  source     = "./infra/modules/instances"
  depends_on = [ module.vpc ]
}
