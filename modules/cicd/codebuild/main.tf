variable "project_name" {
  type = string
}

resource "aws_codebuild_project" "this" {
  name          = var.project_name
  service_role  = "" # set via variable or IAM module
  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:6.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = false
  }

  source {
    type      = "GITHUB"
    location  = "https://github.com/example/repo"
  }
}