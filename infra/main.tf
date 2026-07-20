resource "aws_lambda_function" "myfunction" {
    filename         = data.archive_file.lambda_zip.output_path
    source_code_hash = data.archive_file.lambda_zip.output_base64sha256
    function_name    = "myfunction"
    role             = aws_iam_role.iam_for_lambda.arn
    handler          = "func.lambda_handler"
    runtime          = "python3.14"
}

resource "aws_iam_role" "iam_for_lambda" {
    name = "iam_for_lambda"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            },
        ]
    })
}

resource "aws_iam_policy" "iam_policy_for_resume_project" {
  name        = "iam_policy_for_resume_project"
  description = "IAM policy for the resume project"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "logs:CreateLogGroup"
        ]

        Resource = "arn:aws:logs:eu-west-3:572805506421:*"
      },

      {
        Effect = "Allow"

        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]

        Resource = "arn:aws:logs:eu-west-3:572805506421:*"
      },

      {
        Effect = "Allow"

        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem"
        ]

        Resource = "arn:aws:dynamodb:eu-west-3:572805506421:table/cloud-resume"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy_to_lambda" {
    role       = aws_iam_role.iam_for_lambda.name
    policy_arn = aws_iam_policy.iam_policy_for_resume_project.arn
}

data "archive_file" "lambda_zip" {
    type        = "zip"
    source_dir  = "${path.module}/lambda"
    output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function_url" "url1" {
    function_name = aws_lambda_function.myfunction.function_name
    authorization_type = "NONE"

    cors {
        allow_credentials = false
        allow_origins = ["*"]
        allow_methods = ["*"]
        allow_headers = ["date","keep-alive"]
        expose_headers = ["date","keep-alive"]
        max_age = 86400
    }
}       
