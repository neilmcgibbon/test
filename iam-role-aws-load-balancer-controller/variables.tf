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
