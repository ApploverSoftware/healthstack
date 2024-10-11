resource "awscc_healthlake_fhir_datastore" "this" {
  datastore_name         = var.datastore_name
  datastore_type_version = var.fhir_version

  preload_data_config = var.preload_data ? { preload_data_type = "SYNTHEA" } : null

  sse_configuration = {
    kms_encryption_config = {
      cmk_type   = var.create_kms_key ? "CUSTOMER_MANAGED_KMS_KEY" : "AWS_OWNED_KMS_KEY"
      kms_key_id = var.create_kms_key ? aws_kms_key.datastore[0].arn : null
    }
  }

  lifecycle {
    ignore_changes = [identity_provider_configuration]
  }
}
