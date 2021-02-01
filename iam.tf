resource "aws_iam_role" "invalidator" {
  path               = "/service-role/"
  name   = "${var.project_name}-CodeBuild"
  assume_role_policy = data.aws_iam_policy_document.invalidator_assume_role.json
}

data "aws_iam_policy_document" "invalidator_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "invalidator_attached_policy" {
  role       = aws_iam_role.invalidator.name
  policy_arn = aws_iam_policy.invalidator.arn
}

resource "aws_iam_policy" "invalidator" {
  name   = "${var.project_name}-CodeBuild-Policy"
  policy = data.aws_iam_policy_document.invalidator.json
}

data "aws_iam_policy_document" "invalidator" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      aws_cloudwatch_log_group.invalidator.arn,
      "${aws_cloudwatch_log_group.invalidator.arn}:*",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "cloudfront:GetInvalidation",
      "cloudfront:CreateInvalidation"
    ]
    resources = [
      "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:Get*"
    ]
    resources = [
      var.codepipeline_source_artifact_bucket_arn,
      "${var.codepipeline_source_artifact_bucket_arn}/*",
    ]
  }
}
