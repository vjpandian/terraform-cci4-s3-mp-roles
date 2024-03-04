
variable "aws_access_key" {
  description = "Access key used to create instances"
}

variable "aws_secret_key" {
  description = "Secret key used to create instances"
}

variable "aws_region" {
  description = "Region where instances get created"
  default     = "us-east-2"
}

variable "object_storage_bucket" {
  description = "S3 bucket for server 4.x environment"
  default     = "cci4-bucket-test"
}

variable "cluster_oidc_provider_arn" {
   description = "Cluster OIDC provider ARN for the EKS cluster"
}

variable "cluster_oidc_issuer_url" {
   description = "Cluster OIDC Issuer URL"
}

variable "k8s_namespace" {
   description = "CircleCI Server 4.x Namespace"
   default = "circleci-server"
}
variable "aws_account_id" {
  description = "AWS Account ID"
}

variable "object_storage_irsa_role_arn" {
   description = "S3 object storage role ARN"
}

