terraform {
  required_version = ">= 1.3.1"

  # Provider requirements that we test with and are ensured will work as a release
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.67.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }
}