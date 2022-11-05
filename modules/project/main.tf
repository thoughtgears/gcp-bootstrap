locals {
  project_id      = "${var.project_config.name}-${random_integer.this.result}"
  organization_id = "organizations/${var.organization_id}"
  folder          = var.project_config.folder_id != null ? "folders/${var.project_config.folder_id}" : null
}

resource "random_integer" "this" {
  max = 10000
  min = 99999
}

resource "google_project" "org" {
  count = var.project_config.folder_id == null ? 1 : 0

  name                = var.project_config.name
  project_id          = local.project_id
  org_id              = var.organization_id
  billing_account     = var.billing_id
  labels              = var.labels
  auto_create_network = false # Never create the default network
}

resource "google_project" "folder" {
  count = var.project_config.folder_id != null ? 1 : 0

  name                = var.project_config.name
  project_id          = local.project_id
  folder_id           = var.project_config.folder_id
  billing_account     = var.billing_id
  labels              = var.labels
  auto_create_network = false # Never create the default network
}
