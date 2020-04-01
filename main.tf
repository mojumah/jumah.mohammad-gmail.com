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