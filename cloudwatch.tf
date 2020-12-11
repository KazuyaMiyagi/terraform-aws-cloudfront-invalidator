resource "aws_cloudwatch_log_group" "invalidator" {
  name = var.invalidator_log_group_name
}
