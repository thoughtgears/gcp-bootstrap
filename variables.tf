variable "organization_id" {
  type        = string
  description = "Google Cloud Platform Organization ID"
}

variable "billing_id" {
  type        = string
  description = "ID of the billing account associated with the organization"
}

variable "seed_project_name" {
  type        = string
  description = "Name of seed project, will be concatenated with random number for seed project ID"
  default     = "terraform"
}

variable "organization_project_creators" {
  type        = list(string)
  description = <<-EOF
  Members for the roles/resourcemanager.projectCreator on an organization level.
  This should be for the terraform service account an selected user only.
  Supports:
    * user:{emailid}: An email address that represents a specific Google account. For example, alice@example.com .
  EOF
  default     = []

  validation {
    condition = alltrue([
      for m in var.organization_project_creators : can(regex("^user", m))
    ])
    error_message = "Users that has the right to create projects in the organization."
  }
}

variable "default_region" {
  type        = string
  description = "Default location for the terraform bootstrap"
}