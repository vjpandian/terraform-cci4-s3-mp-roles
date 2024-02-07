
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
