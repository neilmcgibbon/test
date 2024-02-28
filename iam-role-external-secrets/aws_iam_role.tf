################################################################################
#
# External Secrets IAM role
#
################################################################################
resource "aws_iam_role" "this" {
  name               = "${var.iam_role_prefix}${local.cluster_name}-${data.aws_region.current.name}-external-secrets"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.trust.json
}
