resource "aws_iam_role" "s3_role" {
  name = var.object_storage_irsa_role
  assume_role_policy = templatefile("${path.module}/templates/s3_irsa_trust_policy.tpl", {
    OIDC_PRINCIPAL_ID   = var.cluster_oidc_provider_arn
    OIDC_EKS_VARIABLE   = "${replace(var.cluster_oidc_issuer_url, "https://", "")}:sub"
    K8S_SERVICE_ACCOUNT = "system:serviceaccount:${var.k8s_namespace}:object-storage"
    S3_ROLE_ARN         = var.object_storage_irsa_role_arn
  })
  tags = var.default_tags
}


resource "aws_iam_policy" "s3_bucket_irsa_policy" {
  name = var_object_storage_policy
  policy = templatefile("${path.module}/templates/s3_bucket_irsa_policy.tpl", {
    "S3_BUCKET_ARN"  = var.object_storage_bucket_arn
    "AWS_ACCOUNT_ID" = var.aws_account_id
    "S3_ROLE_ARN"    = var.object_storage_irsa_role_arn
  })
  depends_on = [
    aws_iam_role.s3_role
  ]
}

resource "aws_iam_role_policy_attachment" "s3_irsa_attach" {
  role       = aws_iam_role.s3_role.name
  policy_arn = aws_iam_policy.s3_bucket_irsa_policy.arn
  depends_on = [
    aws_iam_policy.s3_bucket_irsa_policy
  ]
}
