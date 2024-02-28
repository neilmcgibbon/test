################################################################################
#
# External Secrets trust policy
#
################################################################################
data "aws_iam_policy_document" "trust" {

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [local.eks_cluster_oidc_provider_arn]
    }

    condition {
      test     = "StringLike"
      variable = "${substr(local.eks_cluster_oidc_issuer_url, 8, -1)}:sub"
      values   = ["system:serviceaccount:kube-system:external-secrets"]
    }
  }
}

################################################################################
#
# External Secrets KMS permissions
#
################################################################################
data "aws_iam_policy_document" "kms_access" {

  statement {
    resources = [local.ssm_kms_arn]
    actions   = ["kms:Decrypt"]
  }
}

################################################################################
#
# External Secrets SSM permissions
#
################################################################################
data "aws_iam_policy_document" "ssm_access" {

  statement {

    resources = ["arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.id}:parameter/*"]

    actions = [
      "ssm:GetParameters",
      "ssm:GetParameter"
    ]
  }

}

################################################################################
#
# External Secrets Secrets Manager permissions
#
################################################################################
data "aws_iam_policy_document" "secretsmanager_access" {
  statement {

    resources = ["arn:aws:secretsmanager:${data.aws_region.current.name}:${data.aws_caller_identity.current.id}:secret:*"]

    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
    ]
  }
}
