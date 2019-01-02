resource "aws_s3_bucket" "terraform_state" {
  bucket = "mg-${var.product}-${var.account}-terraform-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = "${var.tags}"
}

resource "aws_s3_bucket_policy" "terraform_state" {
  bucket = "${aws_s3_bucket.terraform_state.id}"
  policy = "${data.aws_iam_policy_document.bucket_terraform_state.json}"
}
data "aws_iam_policy_document" "bucket_terraform_state" {
  statement {
    sid = "protect_bucket"
    effect = "Deny"
    resources = ["${aws_s3_bucket.terraform_state.arn}"]
    actions   = [
      "s3:DeleteBucket",
      "s3:DeleteBucketPolicy",
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}


resource "aws_dynamodb_table" "terraform_locks" {
  name = "${var.prefix_with_product ? "${var.product}-" : ""}terraform-locks"

  read_capacity = 1
  write_capacity = 1

  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = "${var.tags}"
}
