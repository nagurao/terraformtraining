terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.0.0-rc1"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "repo" {
  name        = "mytest-repo"
  description = "My awesome codebase"
  visibility = "public"
}
