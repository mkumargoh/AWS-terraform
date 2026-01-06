variable "pipeline_name" {
  type = string
}

resource "aws_codepipeline" "this" {
  name     = var.pipeline_name
  role_arn = "" # supply via IAM module

  artifact_store {
    type = "S3"
    location = "" # supply bucket name via variable
  }

  stage {
    name = "Source"
    action {
      name = "Source"
      category = "Source"
      owner    = "ThirdParty"
      provider = "GitHub"
      version  = "1"
      output_artifacts = ["source_output"]
      configuration = {
        Owner = "example"
        Repo  = "repo"
        Branch = "main"
        OAuthToken = "PLACEHOLDER"
      }
    }
  }
}