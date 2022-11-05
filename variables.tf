variable "project" {
  type        = any
  description = "Project module itself."

  validation {
    condition     = contains(keys(var.project), "organization_id") && contains(keys(var.project), "id") && contains(keys(var.project), "number")
    error_message = "You must pass 'module.project' as the value for the variable 'project'."
  }
}