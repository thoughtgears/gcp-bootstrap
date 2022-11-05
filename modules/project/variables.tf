variable "organization_id" {
  type        = string
  description = "Google Cloud Platform Organization ID"

  # Ensures that we only use the raw organization ID
  validation {
    condition     = length(split("organizations/", coalesce(var.organization_id, " "))) == 1 && length(split("organization/", coalesce(var.organization_id, " "))) == 1
    error_message = "You must use the raw id, meaning without prefix 'organizations/'."
  }

  validation {
    condition     = can(regex("[0-9]", var.organization_id))
    error_message = "Org ID must only contain numeric values"
  }
}

variable "billing_id" {
  type        = string
  description = "ID of the billing account associated with the organization"

  validation {
    condition     = can(regex("([a-zA-Z0-9]{1,6})-([a-zA-Z0-9]{1,6})-([a-zA-Z0-9]{1,6})", var.billing_id))
    error_message = "Billing ID must conform to google standards"
  }
}

variable "project_config" {
  type = object({
    name         = string
    folder_id    = optional(string)
    service_apis = optional(list(string))
  })

  validation {
    condition     = can(regex("^[a-zA-Z]+(?:-?[a-zA-Z0-9]+)+$", var.project_config.name))
    error_message = <<-EOF
    Project ID requirements:
      Can only contain lowercase letters, numbers, and hyphens.
      Must start with a letter.
      Cannot end with a hyphen.
    EOF
  }

  # Validate project name restrictions
  validation {
    condition     = length(var.project_config.name) <= 25
    error_message = <<-EOF
    Project ID requirements:
      Must be 6 to 30 characters in length.
      Since we add a random 5 number string to the project, name can never be over 25 characters.
    EOF
  }

  # Ensures that we only allow googleapis.com in the input
  validation {
    condition = var.project_config.service_apis != null ? alltrue([
      for api in var.project_config.service_apis : can(regex("googleapis.com$", api))
    ]) : true
    error_message = "Only supports *.googleapis.com"
  }

  # Ensures that we only use the raw folder ID
  validation {
    condition     = var.project_config.folder_id != null ? length(split("folders/", coalesce(var.project_config.folder_id, " "))) == 1 && length(split("folders/", coalesce(var.project_config.folder_id, " "))) == 1 : true
    error_message = "You must use the raw id, meaning without prefix 'folders/'."
  }

  description = <<-EOF
  Project configuration to define the project. Needs a name that will be concatenated with a random 5 digit string to make the project ID.
  If a folder is specified it will create a folder based on the parent folder described, else it will create a project at the top level of the
  organization.
  If apis are defined they will be concatenated with a list of default API:s to enable during project creation.
  EOF
}

variable "labels" {
  type        = map(string)
  description = "A map of key/pair values to use for project labels"
  default     = {}
}

