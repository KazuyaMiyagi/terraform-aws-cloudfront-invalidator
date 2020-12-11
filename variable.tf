variable "invalidator_log_group_name" {
  type        = string
  description = "CloudWatch Logs log group name"
  default     = "/aws/codebuild/invalidator"
}

variable "codepipeline_source_artifact_bucket_arn" {
  type        = string
  description = "CodePipeline Source artifact bucket arn"
  default     = ""
}
