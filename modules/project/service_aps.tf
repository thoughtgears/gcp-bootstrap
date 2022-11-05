locals {
  service_apis = [
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
  ]
  all_service_apis = var.project_config.service_apis == null ? local.service_apis : concat(var.project_config.service_apis, local.service_apis)
}

resource "google_project_service" "this" {
  for_each = toset(local.all_service_apis)

  project = var.project_config.folder_id == null ? google_project.org.0.id : google_project.folder.0.id
  service = each.value

  disable_dependent_services = false
}