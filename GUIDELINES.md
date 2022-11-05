# Terraform Module Guidelines

This directory should be used as a starter point for developing terraform modules for gcp, it should contain everything needed to start coding your modules including examples.  
GCP modules needs to be built very modular and allow for a generous input stream if needed, there should be default standards that follow our framework and best practices.

## How to use the template directory

When creating a new repository, choose the gcp-template-modules as a template. This will init a repository based on this one.  
Use the example/ as a starting point for cloning and start writing your module.

## Guidelines for creating modules

### Content

- [Guidelines for creating modules](#guidelines-for-creating-modules)
    - [Content](#content)
    - [General guidelines](#general-guidelines)
    - [Tree structure of our module repository](#tree-structure-of-our-module-repository)
    - [Terraform-docs](#terraform-docs)
    - [Release guidelines](#release-guidelines)

### General guidelines

- Modules should always contain a README.md. They are the first reference for on how to use the module.
- All variables should have a description.
- `terraform-docs` should be used to generate the Requirements/Providers/Modules/Resources/Inputs/Outputs section of the README.md.
- Outputs should be provided for the resources created in the modules as we want to be able to pass their references to the others modules of the consumer codebase.
- Your module should contain the `versions.tf` to isolate this content from the all rest. That's where you define anything related to a version specification.
- All code should be commented where it is not a directed reference to the provider documentation.
- All arbitrary or wrapped resources arguments input variables should be validated. Why? You will argue that the Terraform engine can validate by itself. But when you wrap a resource argument, then the logic of validation might change.
  Thanks to validations, you also make sure getting the result at the plan stage, not having to wait for the apply and unknown values to be returned by some API callback.
  In simple words, if you passthrough a resource argument, you don't need to implement a validator.
  See the template `variables.tf` for some detailed cases.
- All modules should enable the APIs needed for the module to work
- All service accounts should be created inside the module and their ids and names output.
- All modules should include needed submodules, like vpc-network should contain subnetwork, router and so on

## Tree structure of our module repository

```
.
├── .github                => GitHub configuration
├── .security              => Configuration of any tool used to ensure security standards on this repo itself
├── .tool-versions         => Binaries used in the framework (GCP SDK, Terraform, etc...) and usually ASDF deployed
├── .                      => Generic root level of modules
└── helper                 => Bash script providing some helping features on the repo
```

## Terraform-docs

The call you need: `terraform-docs markdown table --output-file README.md --output-mode inject`

> also supported in github workflows on PRs to main.

## Release guidelines

To release a new version of the modules you create and push a tag to the repository with the next version for your module.

```shell
git tag -a v0.0.2 -m "Commit message that you want to use with tag"
git push origin v0.0.2
```

A template of a good release note looks like:

```
## What's Changed

### [PR #xxx]
##### Changes
* This is my squash 1st commit message
* This is my squash 2nd commit message
##### Breaking Changes
* Describe what can break by upgrading to this version of the module. For example change in input and output contract and explain the new contract.

###### Previous Tag: x.y.z
```

## Supporting tools and frameworks
All GitHub actions used in this repository should be reusable workflows [https://docs.github.com/en/actions/using-workflows/reusing-workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows).
We use workflows from [https://github.com/thoughtgears/github-actions-workflows](https://github.com/thoughtgears/github-actions-workflows).

---
