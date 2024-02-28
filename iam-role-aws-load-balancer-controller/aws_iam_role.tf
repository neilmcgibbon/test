################################################################################
#
# AWS Load Balancer Controller role
#
################################################################################
resource "aws_iam_role" "this" {
  name               = "${var.iam_role_prefix}${local.cluster_name}-${data.aws_region.current.name}-aws-load-balancer-controller"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.trust.json
}
