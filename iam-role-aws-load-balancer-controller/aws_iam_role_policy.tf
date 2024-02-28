################################################################################
#
# Attaches default policy to role
#
################################################################################
resource "aws_iam_role_policy" "default" {
  name   = "default-policy"
  role   = aws_iam_role.this.name
  policy = data.aws_iam_policy_document.default.json
}
