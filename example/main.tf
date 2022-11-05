# Should come from the project module, but will define it in the template just to show off how a test can be made
variable "organization_id" {}
variable "id" {}
variable "number" {}

locals {
  project = {
    organization_id = var.organization_id
    id = var.id
    number = var.number
  }
}

module "template" {
  source = "../"
  project = local.project
}

output "id" {
  value = module.template.project.id
}

output "organization_id" {
  value = module.template.project.organization_id
}

output "number" {
  value = module.template.project.number
}