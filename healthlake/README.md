# AWS HealthLake

AWS HealthLake is a service that allows healthcare organizations to store, transform, and analyze health data in FHIR standard.

Using this module you can boostrap FHIR repository to exchange data for introducing health data exchange with associates.

HealthLake supported regions:

- Asia Pacific (Mumbai)
- Europe (London)
- Asia Pacific (Sydney)
- US East (N. Virginia)
- US East (Ohio)
- US West (Oregon)

## Example usage

You can initialize FHIR repository with Synthea preloaded data:

```tf
module "healthlake" {
  source = "./healthlake"

  datastore_name    = "fhir-sandbox"
  kms_admin_iam_arn = "arn:aws:iam::123:user/user"
  preload_data      = true
  create_kms_key    = true
  data_bucket_name  = "fhir-bucket"
  logs_bucket_name  = "fhir-logs-bucket"
}
```


> 🔴 Note that the `awscc_healthlake_fhir_datastore` resource takes about 20-30 minutes to be created and 15-20 minutes to be destroyed. 🔴


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_awscc"></a> [awscc](#provider\_awscc) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.healthlake](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.healthlake](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.datastore](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.access_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.access_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.access_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_logging.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_public_access_block.access_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.access_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.access_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [awscc_healthlake_fhir_datastore.this](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/healthlake_fhir_datastore) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_kms_key"></a> [create\_kms\_key](#input\_create\_kms\_key) | Whether to create KMS key or use AWS managed one | `bool` | `false` | no |
| <a name="input_data_bucket_name"></a> [data\_bucket\_name](#input\_data\_bucket\_name) | The name of the S3 bucket to be used for import/export data | `string` | n/a | yes |
| <a name="input_datastore_name"></a> [datastore\_name](#input\_datastore\_name) | The name of the datastore to be used in the infrastructure | `string` | n/a | yes |
| <a name="input_fhir_version"></a> [fhir\_version](#input\_fhir\_version) | The version of FHIR to be used for the datastore | `string` | `"R4"` | no |
| <a name="input_healthlake_policy_name"></a> [healthlake\_policy\_name](#input\_healthlake\_policy\_name) | The name for IAM Role for import/export data | `string` | `"HealthLakeImportExportPolicy"` | no |
| <a name="input_healthlake_role_name"></a> [healthlake\_role\_name](#input\_healthlake\_role\_name) | The name for IAM Role for import/export data | `string` | `"HealthLakeImportExportRole"` | no |
| <a name="input_kms_admin_iam_arn"></a> [kms\_admin\_iam\_arn](#input\_kms\_admin\_iam\_arn) | The IAM ARN of an admin user that will manage KMS key | `string` | `""` | no |
| <a name="input_logs_bucket_name"></a> [logs\_bucket\_name](#input\_logs\_bucket\_name) | The name of the S3 bucket used for logging access to data bucket | `string` | n/a | yes |
| <a name="input_preload_data"></a> [preload\_data](#input\_preload\_data) | Whether to preload dummy data into FHIR | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_datastore_arn"></a> [datastore\_arn](#output\_datastore\_arn) | n/a |
| <a name="output_datastore_endpoint"></a> [datastore\_endpoint](#output\_datastore\_endpoint) | n/a |
| <a name="output_datastore_kms_key_arn"></a> [datastore\_kms\_key\_arn](#output\_datastore\_kms\_key\_arn) | n/a |
| <a name="output_s3_kms_key_arn"></a> [s3\_kms\_key\_arn](#output\_s3\_kms\_key\_arn) | n/a |
<!-- END_TF_DOCS -->