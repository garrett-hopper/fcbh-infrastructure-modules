resource "aws_dynamodb_table" "dynamodb" {
  name         = "dbp-etl-${random_string.random.result}"
  hash_key     = "key"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "key"
    type = "S"
  }
}
