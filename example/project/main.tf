# Should come from the project module, but will define it in the template just to show off how a test can be made
variable "organization_id" {}
variable "billing_id" {}
variable "project_config" {
  type = object({
    name         = string
    folder_id    = optional(string)
    service_apis = optional(list(string))
  })
}

module "labels" {
  source = "../../modules/labels"

  project_name = var.project_config.name
}


module "project" {
  source = "../../modules/project"

  organization_id = var.organization_id
  billing_id      = var.billing_id

  project_config = var.project_config
}

output "project" {
  value = module.project
}
