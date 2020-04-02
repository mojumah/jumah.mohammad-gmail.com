# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-2"
  shared_credentials_file = "C:\\Users\\wafa\\.aws\\credentials"
}

resource "aws_s3_bucket" "b" {
  bucket = "yasmin-nails-studio.com"
  acl    = "public-read"


  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "yasmin-nails-studio.com"
  key    = "index.html"
  source = "C:\\Users\\wafa\\yasmin\\index.html"

}



resource "aws_s3_bucket_policy" "policy" {
  bucket = "${aws_s3_bucket.b.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AddPerm",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::yasmin-nails-studio.com/*"

    }
  ]
}
POLICY
}