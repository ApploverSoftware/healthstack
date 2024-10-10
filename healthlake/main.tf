data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "awscc_healthlake_fhir_datastore" "this" {
  datastore_name         = var.datastore_name
  datastore_type_version = var.fhir_version

  preload_data_config = var.preload_data ? { preload_data_type = "SYNTHEA" } : null

  sse_configuration = {
    kms_encryption_config = {
      cmk_type   = var.create_kms_key ? "CUSTOMER_MANAGED_KMS_KEY" : "AWS_OWNED_KMS_KEY"
      kms_key_id = var.create_kms_key ? aws_kms_key.this[0].arn : null
    }
  }
  lifecycle {
    ignore_changes = [identity_provider_configuration]
  }
}

resource "aws_kms_key" "this" {
  count = var.create_kms_key ? 1 : 0

  description         = "This key encrypts FHIR datastore"
  enable_key_rotation = true
}

resource "aws_kms_key_policy" "this" {
  count = var.create_kms_key ? 1 : 0

  key_id = aws_kms_key.this[0].id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "key-default-1"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      },
      {
        Sid    = "Allow administration of the key"
        Effect = "Allow"
        Principal = {
          AWS = "${var.kms_admin_iam_arn}"
        }
        Action = [
          "kms:ReplicateKey",
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion"
        ]
        Resource = "*"
      }
    ]
  })
}