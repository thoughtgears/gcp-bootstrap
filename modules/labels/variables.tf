variable "custom" {
  type        = any
  description = <<-EOF
  An object of custom labels to merge with the default ones.
  Define them by passing in an object:
  custom = {
      label1 = "example1"
      label2 = "example2"
  }
  EOF
  default     = null
}

variable "contact" {
  type        = string
  description = "Contact email for main contact of project"
  default     = null
}

variable "git_info" {
  type        = bool
  description = <<-EOF
  If git information should be included, if true it will look up information about your repository to ensure
  we can get repo name, organization and commit sha to use for default labels.
  EOF
  default     = true
}

variable "project_name" {
  type        = string
  description = "Name of the project for the labels"
}
