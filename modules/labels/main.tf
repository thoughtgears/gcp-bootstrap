locals {
  default = {
    terraform        = "true"
    contact          = var.contact != null ? replace(replace(replace(var.contact, "@", "-at-"), ".", "-dot-"), "_", "-") : null
    git_repository   = var.git_info ? lower(tostring(data.external.get_git_info.result.repo_name)) : null
    git_organization = var.git_info ? lower(tostring(data.external.get_git_info.result.owner)) : null
    project_name     = var.project_name
  }

  all_labels = var.custom != null ? merge(var.custom, local.default) : local.default

  purged_all_labels     = { for k, v in local.all_labels : k => v if v != null }
  purged_default_labels = { for k, v in local.default : k => v if v != null }
}

data "external" "get_git_info" {
  program = ["bash", "-c", <<-EOT
    repo_name="$(/usr/bin/git ls-remote --get-url 2>/dev/null | sed -e 's#^.*github.com/##' -e 's#^.*:##' -e 's#.git$##' | sed -e 's#^.*/##')";
    owner="$(/usr/bin/git ls-remote --get-url 2>/dev/null | sed -e 's#^.*github.com/##' -e 's#^.*:##' -e 's#.git$##' | sed -e 's#/.*$##')";
    jq -n --arg repo_name "$repo_name" --arg owner "$owner" '{"repo_name":$repo_name, "owner":$owner}';
    EOT
  ]
}
