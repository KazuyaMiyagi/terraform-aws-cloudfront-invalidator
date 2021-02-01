variable "project_name" {
  type        = string
  description = "Project name"
  default     = "cloudfront-invalidator"
}

variable "codepipeline_source_artifact_bucket_arn" {
  type        = string
  description = "CodePipeline Source artifact bucket arn"
  default     = ""
}
