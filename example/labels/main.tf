module "labels" {
  source       = "../../modules/labels"
  project_name = "test"

  git_info = true

  custom = {
    label1 = "example"
  }
}

output "labels" {
  value = module.labels.all
}

output "default" {
  value = module.labels.default
}