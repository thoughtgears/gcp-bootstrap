locals {
  project_config = {
    name = var.seed_project_name
  }
}

module "project" {
  source          = "./modules/project"
  billing_id      = var.billing_id
  organization_id = var.organization_id
  project_config  = local.project_config
}