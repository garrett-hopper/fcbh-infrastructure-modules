resource "aws_lambda_function" "lambda_validate" {
  function_name    = "validate-${random_string.random.result}"
  handler          = "Handler.handler"
  runtime          = "python3.8"
  role             = aws_iam_role.iam_lambda.arn
  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")
  memory_size      = 512
  timeout          = 60

  environment {
    variables = {
      UPLOAD_BUCKET = aws_s3_bucket.s3_upload.id
    }
  }
}

resource "aws_cloudwatch_log_group" "lambda_validate" {
  name = "/aws/lambda/${aws_lambda_function.lambda_validate.function_name}"
}

output "validate_lambda" {
  value = aws_lambda_function.lambda_validate.function_name
}
