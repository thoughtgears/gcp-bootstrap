module "bootstrap" {
  source          = "../"
  billing_id      = "XOXOXO-ABABAB-MWMWMW"
  default_region  = "europe-west2"
  organization_id = "12345678"

  organization_project_creators = ["user:john.doe@example.com"]
}

output "project" {
  value = "created project: ${module.bootstrap.project.id}"
}

output "state_bucket" {
  value = "created terraform state bucket: ${module.bootstrap.state_bucket}"
}

output "terraform_service_account" {
  value = "created a terraform service account : ${module.bootstrap.terraform_service_account_email}"
}