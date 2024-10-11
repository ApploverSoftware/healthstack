variable "datastore_name" {
  description = "The name of the datastore to be used in the infrastructure"
  type        = string
}

variable "fhir_version" {
  description = "The version of FHIR to be used for the datastore"
  type        = string
  default     = "R4"
}

variable "kms_admin_iam_arn" {
  description = "The IAM ARN of an admin user that will manage KMS key"
  type        = string
  default     = ""
}

variable "create_kms_key" {
  description = "Whether to create KMS key or use AWS managed one"
  type        = bool
  default     = false
}

variable "preload_data" {
  description = "Whether to preload dummy data into FHIR"
  type        = bool
  default     = false
}

variable "data_bucket_name" {
  description = "The name of the S3 bucket to be used for import/export data"
  type        = string
}

variable "logs_bucket_name" {
  description = "The name of the S3 bucket used for logging access to data bucket"
  type        = string
}

variable "healthlake_role_name" {
  description = "The name for IAM Role for import/export data"
  type        = string
  default     = "HealthLakeImportExportRole"
}

variable "healthlake_policy_name" {
  description = "The name for IAM Role for import/export data"
  type        = string
  default     = "HealthLakeImportExportPolicy"
}