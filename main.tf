# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-2"
  shared_credentials_file = "C:\\Users\\wafa\\.aws\\credentials"
}

resource "aws_s3_bucket" "b" {
  bucket = "yasminsalon.com"
  acl    = "public-read"


  website {
    index_document = "index.html"
    error_document = "error.html"


  }
}

resource "aws_s3_bucket" "c" {
  bucket = "manicure.yasminsalon.com"
  acl    = "public-read"


  website {
    index_document = "manicure.html"
    error_document = "error.html"


  }
}

resource "aws_s3_bucket" "d" {
  bucket = "pedicure.yasminsalon.com"
  acl    = "public-read"


  website {
    index_document = "pedicure.html"
    error_document = "error.html"


  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "${aws_s3_bucket.b.bucket}"
  key    = "index.html"
  source = "C:\\Users\\wafa\\yasmin\\index.html"
  content_type = "text/html"

}

resource "aws_s3_bucket_object" "objecttwo" {
  bucket = "${aws_s3_bucket.c.bucket}"
  key    = "manicure.html"
  source = "C:\\Users\\wafa\\yasmin\\manicure.html"
  content_type = "text/html"

}

resource "aws_s3_bucket_object" "objectthree" {
  bucket = "${aws_s3_bucket.d.bucket}"
  key    = "pedicure.html"
  source = "C:\\Users\\wafa\\yasmin\\pedicure.html"
  content_type = "text/html"

}



resource "aws_s3_bucket_policy" "policy" {
  bucket = "${aws_s3_bucket.b.bucket}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AddPerm",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::yasminsalon.com/*"

    }
  ]
}
POLICY
}

resource "aws_s3_bucket_policy" "policytwo" {
  bucket = "${aws_s3_bucket.c.bucket}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AddPerm",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::manicure.yasminsalon.com/*"

    }
  ]
}
POLICY
}

resource "aws_s3_bucket_policy" "policythree" {
  bucket = "${aws_s3_bucket.d.bucket}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AddPerm",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::pedicure.yasminsalon.com/*"

    }
  ]
}
POLICY
}