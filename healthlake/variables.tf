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
