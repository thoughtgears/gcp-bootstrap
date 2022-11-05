locals {
  seed_project_id = "${var.seed_project_name}-${random_integer.seed.result}"
}

resource "random_integer" "seed" {
  max = 10000
  min = 99999
}

resource "google_project" "seed" {
  name       = var.seed_project_name
  project_id = local.seed_project_id
}