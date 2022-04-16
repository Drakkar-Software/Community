data "aws_iam_policy_document" "minimal_s3_permissions" {
  statement {
    sid = "AllowS3OperationsOnElasticBeanstalkBuckets"
    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation"
    ]
    resources = ["*"]
  }
}

resource "aws_s3_bucket" "application_bucket" {
  bucket = "${var.namespace}.${var.stage}.${var.name}.bucket"
}

resource "aws_s3_object" "application_bucket_object" {
  bucket = aws_s3_bucket.application_bucket.id
  key    = "beanstalk/${var.version_label}"
  source = "${var.version_label}.zip"
}

resource "aws_elastic_beanstalk_application_version" "application_version" {
  name        = var.version_label
  application = module.elastic_beanstalk_application.elastic_beanstalk_application_name
  description = var.version_description
  bucket      = aws_s3_bucket.application_bucket.id
  key         = aws_s3_object.application_bucket_object.id
}
