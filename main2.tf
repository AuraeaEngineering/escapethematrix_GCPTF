terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.26.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "exit-the-matrix"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "exit-the-matrix-733091916879.json"


}
resource "google_storage_bucket" "exit-the-matrix-bucket1" {
  name          = "exit-the-matrix"
  location      = "us-central1"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
