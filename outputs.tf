output "project" {
  # Output variable for the project
  value = module.project
}

output "terraform_service_account_email" {
  value = google_service_account.terraform.email
}

output "terraform_service_account_id" {
  value = google_service_account.terraform.id
}

output "state_bucket" {
  value = google_storage_bucket.terraform_state.name
}