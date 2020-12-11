resource "aws_codebuild_project" "invalidator" {
  name          = "cloudfront-invalidator"
  description   = "Create CloudFront Invalidation project."
  build_timeout = 60
  service_role  = aws_iam_role.invalidator.arn

  logs_config {
    cloudwatch_logs {
      status     = "ENABLED"
      group_name = aws_cloudwatch_log_group.invalidator.name
    }
    s3_logs {
      status = "DISABLED"
    }
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false

    environment_variable {
      name  = "DISTRIBUTION_ID"
      type  = "PLAINTEXT"
      value = ""
    }

    environment_variable {
      name  = "INVALIDATION_PATH"
      type  = "PLAINTEXT"
      value = ""
    }
  }

  source {
    type      = "NO_SOURCE"
    buildspec = file("${path.module}/buildspec.yml")
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
}
