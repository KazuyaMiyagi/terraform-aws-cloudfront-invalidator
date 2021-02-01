resource "aws_cloudwatch_log_group" "invalidator" {
  name = "/aws/codebuild/${var.project_name}"
}
