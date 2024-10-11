output "datastore_endpoint" {
  value = awscc_healthlake_fhir_datastore.this.id
}

output "datastore_arn" {
  value = awscc_healthlake_fhir_datastore.this.datastore_arn
}

output "datastore_kms_key_arn" {
  value = aws_kms_key.datastore[0].arn
}

output "s3_kms_key_arn" {
  value = aws_kms_key.s3.arn
}