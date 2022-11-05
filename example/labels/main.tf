module "labels" {
  source = "../../modules/labels"
  project = {
    id = "test-1234"
  }

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