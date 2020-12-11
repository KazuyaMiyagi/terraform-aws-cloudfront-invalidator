Amazon Cloudfront invalidator Terraform module
====================================================================================================

This terraform module creates an Amazon CloudFront distribution Invalidation project in CodeBuild

Usage
----------------------------------------------------------------------------------------------------

```hcl
module "cloudfront-invalidator" {
  source                                  = "KazuyaMiyagi/cloudfront-invalidator/aws"
  invalidator_log_group_name              = "/aws/codebuild/invalidator"
  codepipeline_source_artifact_bucket_arn = aws_s3_bucket.pipeline_artifact.arn
}
```

Examples
----------------------------------------------------------------------------------------------------

* [Simple](https://github.com/KazuyaMiyagi/terraform-aws-cloudfront-invalidator/tree/master/examples/simple)

Requirements
----------------------------------------------------------------------------------------------------

| Name      | Version    |
|-----------|------------|
| terraform | >= 0.12.\* |
| aws       | >= 3.12.\* |

Providers
----------------------------------------------------------------------------------------------------

| Name | Version    |
|------|------------|
| aws  | >= 3.12.\* |

Inputs
----------------------------------------------------------------------------------------------------

| Name                                        | Description                             | Type     | Default                        | Required |
|---------------------------------------------|-----------------------------------------|----------|--------------------------------|:--------:|
| invalidator\_log\_group\_name               | CloudWatch Logs log group name          | `string` | `"/aws/codebuild/invalidator"` | no       |
| codepipeline\_source\_artifact\_bucket\_arn | CodePipeline Source artifact bucket arn | `string` | `""`                           | yes      |

Outputs
----------------------------------------------------------------------------------------------------

| Name          | Description            |
|---------------|------------------------|
| project\_name | CodeBuild project name |


License
----------------------------------------------------------------------------------------------------

Apache 2 Licensed. See LICENSE for full details.
