terraform {
  # This module is now only being tested with Terraform 1.0.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 1.0.x code.
  required_version = ">= 0.12.26"

  # Provider requirements that we test with and are ensured will work as a release
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.67.0"
    }
  }
}