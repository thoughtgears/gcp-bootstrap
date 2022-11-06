# gcp-bootstrap

![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

## Usage

The bootstrap terraform is to help you start out with terraform in GCP. It creates an initial seed project with a service account,  
storage bucket and some initial permissions for the service account and if supplied, the initial users of the Google Workspace.  

To start you should have created an organization in Google Cloud and gone through the initial steps such as setting up a billing  
account and added your first user.  Your user will need to have Billing Account Administrator, Project Creator and Project Billing  
Manager. After this initial bootstrap it's recommended to use the terraform service account as an actor when modifying your infrastructure.

Example on how to use this bootstrap is in the example directory.  
Using the example should get you started with terraform, if you want to extend your boostrap you can use multiple more modules to ensure  
the perfect environment is there before starting using Google Cloud Platform.  

[gcp-bootstrap/example](https://github.com/thoughtgears/gcp-bootstrap/tree/main/example)

#### Useful commands to know before bootstraping. 

`gcloud auth login` **logs your gcloud cli into google cloud and you are ready to use the SDK**  
`gcloud auth application-default login` **logs your gcloud in and gets you credentials for the ADC that google sdks often need**  
`gcloud --impersonate-service-account=tf-admin@<project_id>.iam.gserviceaccount.com <gcloud command>` **impersonate the service account while running commands**  
`gcloud config set auth/impersonate_service_account tf-admin@<project_id>.iam.gserviceaccount.com` **set impersonation in gcloud config**  

You can also impersonate service accounts in terraform  
```hcl
terraform {
  backend "gcs" {
    bucket                      = "GCS_BUCKET_NAME"
    prefix                       = "OPTIONAL_PREFIX"
    impersonate_service_account = "YOUR_SERVICE_ACCOUNT@YOUR_PROJECT.iam.gserviceaccount.com"
  }
}
```

## Module resource documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.67.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project"></a> [project](#module\_project) | git@github.com:thoughtgears/gcp-project-module.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_billing_account_iam_member.terraform_billing_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_account_iam_member) | resource |
| [google_organization_iam_binding.project_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_binding) | resource |
| [google_organization_iam_binding.terraform_org_permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_binding) | resource |
| [google_service_account.terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.terraform_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [random_id.state_bucket_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_id"></a> [billing\_id](#input\_billing\_id) | ID of the billing account associated with the organization | `string` | n/a | yes |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | Default location for the terraform bootstrap | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | Google Cloud Platform Organization ID | `string` | n/a | yes |
| <a name="input_organization_project_creators"></a> [organization\_project\_creators](#input\_organization\_project\_creators) | Members for the roles/resourcemanager.projectCreator on an organization level.<br>This should be for the terraform service account an selected user only.<br>Supports:<br>  * user:{emailid}: An email address that represents a specific Google account. For example, alice@example.com . | `list(string)` | `[]` | no |
| <a name="input_seed_project_name"></a> [seed\_project\_name](#input\_seed\_project\_name) | Name of seed project, will be concatenated with random number for seed project ID | `string` | `"terraform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project"></a> [project](#output\_project) | n/a |
| <a name="output_state_bucket"></a> [state\_bucket](#output\_state\_bucket) | n/a |
| <a name="output_terraform_service_account_email"></a> [terraform\_service\_account\_email](#output\_terraform\_service\_account\_email) | n/a |
| <a name="output_terraform_service_account_id"></a> [terraform\_service\_account\_id](#output\_terraform\_service\_account\_id) | n/a |
<!-- END_TF_DOCS -->