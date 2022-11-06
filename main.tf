locals {
  project_config = {
    name = var.seed_project_name
  }

  organization_project_creators = concat(var.organization_project_creators, [
    "serviceAccount:${google_service_account.terraform.email}"
  ])

  tf_organization_roles = [
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.organizationViewer",
  ]

  state_bucket_name = "tf-state-${random_integer.state_bucket_suffix.id}"

}

resource "random_integer" "state_bucket_suffix" {
  keepers = {
    project_id = module.project.id
  }

  max = 999999
  min = 100000
}
/***********************************************
  Create initial terraform seed project.
 ***********************************************/

module "project" {
  source          = "git@github.com:thoughtgears/gcp-project-module.git?ref=v1.0.1"
  billing_id      = var.billing_id
  organization_id = var.organization_id
  project_config  = local.project_config
}

resource "google_service_account" "terraform" {
  project    = module.project.id
  account_id = "terraform-admin"
}

resource "google_storage_bucket" "terraform_state" {
  project       = module.project.id
  name          = local.state_bucket_name
  location      = var.default_region
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "terraform_state" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.terraform.email}"
}

/*************************************************************************
  Set organisation permissions for groups and terraform service account.
 *************************************************************************/

resource "google_organization_iam_binding" "project_creator" {
  org_id  = var.organization_id
  role    = "roles/resourcemanager.projectCreator"
  members = local.organization_project_creators
}

resource "google_billing_account_iam_member" "terraform_billing_admin" {
  billing_account_id = var.billing_id
  role               = "roles/billing.admin"
  member             = "serviceAccount:${google_service_account.terraform.email}"
}

resource "google_organization_iam_binding" "terraform_org_permissions" {
  for_each = toset(local.tf_organization_roles)
  org_id   = var.organization_id
  role     = each.value
  members  = ["serviceAccount:${google_service_account.terraform.email}"]
}
