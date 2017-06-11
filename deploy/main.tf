variable "bucket_site" {}
variable "region" {}
variable "route53_domain_name" {}
variable "route53_domain_zoneid" {}

provider "aws" {
    region = "${var.region}"
}

resource "aws_s3_bucket" "site" {
    bucket = "${var.bucket_site}"
    acl = "public-read"
    policy = <<EOF
{
  "Id": "bucket_policy_site",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_site_main",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.bucket_site}/*",
      "Principal": "*"
    }
  ]
}
EOF
    website {
        index_document = "index.html"
        error_document = "404.html"
    }
    tags {
    }
    force_destroy = true
}

resource "aws_route53_record" "domain" {
   name = "${var.route53_domain_name}"
   zone_id = "${var.route53_domain_zoneid}"
   type = "CNAME"
   ttl = "60"
   records = [" http://we-hickox-site.s3-website-us-west-2.amazonaws.com"]
}
