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