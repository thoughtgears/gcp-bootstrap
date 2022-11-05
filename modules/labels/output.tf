output "all" {
  value = local.purged_all_labels
}

output "default" {
  value = local.purged_default_labels
}

output "custom" {
  value = var.custom
}