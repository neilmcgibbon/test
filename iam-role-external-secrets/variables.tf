variable "cluster_name" {
  description = "The name of the cluster, used in all named resources"
  type        = string
}

variable "eks_cluster_oidc_provider_arn" {
  description = "ARN of the cluster's OIDC provider"
  type        = string
}

variable "eks_cluster_oidc_issuer_url" {
  description = "Issuer URL of the cluster's OIDC provider"
  type        = string
}

variable "iam_role_prefix" {
  description = "Prefix for generated IAM role name"
  type        = string
  default     = ""
}

variable "ssm_kms_arn" {
  description = "The ARN of the KMS used for secret value storage."
  type        = string

  # Note, we perform validation rather than relying on default, as default is set 
  # from parent as empty string, in case this module is not used.
  validation {
    condition = (
      length(var.ssm_kms_arn) > 0
    )
    error_message = "ssm_kms_arn parameter must be set"
  }
}
