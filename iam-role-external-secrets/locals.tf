locals {
  cluster_name                  = var.cluster_name
  eks_cluster_oidc_provider_arn = var.eks_cluster_oidc_provider_arn
  eks_cluster_oidc_issuer_url   = var.eks_cluster_oidc_issuer_url
  ssm_kms_arn                   = var.ssm_kms_arn
}
