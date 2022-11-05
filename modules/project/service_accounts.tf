resource "google_service_account" "terraform" {
  project    = var.project_config.folder_id == null ? google_project.org.0.id : google_project.folder.0.id
  account_id = "terraform-admin"
}

