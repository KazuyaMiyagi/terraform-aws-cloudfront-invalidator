data "aws_arn" "codebuild_project" {
  arn = aws_codebuild_project.invalidator.arn
}

output "project_name" {
  value = trimprefix(data.aws_arn.codebuild_project.resource, "project/")
}
