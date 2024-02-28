################################################################################
#
# Attaches KMS access policy to External Secrets role
#
################################################################################
resource "aws_iam_role_policy" "kms_access" {
  name   = "kms-access"
  role   = aws_iam_role.this.name
  policy = data.aws_iam_policy_document.kms_access.json
}

################################################################################
#
# Attaches SSM access policy to External Secrets role
#
################################################################################
resource "aws_iam_role_policy" "ssm_access" {
  name   = "ssm-access"
  role   = aws_iam_role.this.name
  policy = data.aws_iam_policy_document.ssm_access.json
}


################################################################################
#
# Attaches Secrets Manager access policy to External Secrets role
#
################################################################################
resource "aws_iam_role_policy" "secretsmanager_access" {
  name   = "secretsmanager-access"
  role   = aws_iam_role.this.name
  policy = data.aws_iam_policy_document.secretsmanager_access.json
}

