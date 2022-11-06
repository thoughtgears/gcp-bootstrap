# gcp-bootstrap

![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

## Usage

```hcl
module "my" {
  source  = "git::git@github.com:thoughtgears/gcp-xxxx-module.git?ref=latest"

  project   = var.project
  variable1 = "hello"
}
```

## What's in this repo

This repo has the following folder structure:

- [examples](https://github.com/thoughtgears/gcp-xxx-modules/examples): The example folder contains an one or more examples of how to use the modules.

- [root](https://github.com/thoughtgears/gcp-xxx-modules/blob/main): This root contains the module code.

  List of submodules:

    - [template-module](https://github.com/thoughtgears/gcp-xxx-modules/blob/main/template-module/README.md): The submodules needed to deliver a full experience.

- [test](https://github.com/thoughtgears/gcp-xxx-modules/blob/main/test): Automated tests modules and examples.

## What's a Module?

A Module is a canonical, reusable, best-practices definition for how to run a single piece of infrastructure, such as a database or server cluster.  
Each Module is written using a combination of [Terraform](https://www.terraform.io/) and scripts (mostly bash) and include automated tests, documentation, and examples.  
It is maintained both by the open source community and companies that provide commercial support.

Instead of figuring out the details of how to run a piece of infrastructure from scratch, you can reuse  existing code that has been proven in production.  
And instead of maintaining all that infrastructure code yourself, you can leverage the work of the Module community to pick up infrastructure improvements through a version number bump.

## How is this Module versioned?

This Module follows the principles of [Semantic Versioning](http://semver.org/). You can find each new release, along with the changelog, in the [Releases Page](https://github.com/thoughtgears/gcp-xxx-modules/releases).

During initial development, the major version will be 0 (e.g., `0.x.y`), which indicates the code does not yet have a stable API.  
Once we hit `1.0.0`, we will make every effort to maintain a backwards compatible API and use the MAJOR, MINOR, and PATCH versions on each release to indicate any incompatibilities.

## Module resource documentation

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->