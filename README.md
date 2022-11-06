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
<!-- END_TF_DOCS -->