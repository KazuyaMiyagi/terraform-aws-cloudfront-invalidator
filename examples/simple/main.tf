# https://www.terraform.io/docs/providers/aws/d/caller_identity.html
# account data
data "aws_caller_identity" "current" {}

module "cloudfront-invalidator" {
  source                                  = "../../"
  invalidator_log_group_name              = "/aws/codebuild/invalidator"
  codepipeline_source_artifact_bucket_arn = aws_s3_bucket.pipeline_artifact.arn
}
