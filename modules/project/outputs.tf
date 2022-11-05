output "id" {
  value = var.project_config.folder_id == null ? google_project.org.0.id : google_project.folder.0.id
}

output "name" {
  value = var.project_config.folder_id == null ? google_project.org.0.name : google_project.folder.0.name
}

output "number" {
  value = var.project_config.folder_id == null ? google_project.org.0.number : google_project.folder.0.number
}

output "organization_id" {
  value = var.organization_id
}

output "folder" {
  value = var.project_config.folder_id != null ? local.folder : null
}

output "billing_id" {
  value = var.billing_id
}

output "terraform_service_account_id" {
  value = google_service_account.terraform.id
}

output "terraform_service_account_email" {
  value = google_service_account.terraform.email
}

output "permissions" {
  value = {
    "role/owner" = "serviceAccount${google_service_account.terraform.email}"
  }
}