resource "aws_s3_bucket" "s3_upload" {
  bucket = "dbp-etl-upload-${random_string.random.result}"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["POST", "PUT", "GET"]
    allowed_origins = ["*"]
    expose_headers = [
      "Content-Length",
      "Content-Type",
      "Connection",
      "Date",
      "ETag",
      "Server",
    ]
  }
}

resource "aws_s3_bucket" "s3_destination" {
  bucket = "dbp-etl-destination-${random_string.random.result}"
}

resource "aws_s3_bucket_object" "s3_lpts" {
  bucket = aws_s3_bucket.s3_upload.id
  key    = "qry_dbp4_Regular_and_NonDrama.xml"
}
