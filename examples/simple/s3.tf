resource "aws_s3_bucket" "pipeline_artifact" {
  bucket        = "pipeline-artifact-${data.aws_caller_identity.current.account_id}"
  acl           = "private"
}
