output "invoke_arn" {
  description = "The ARN to be used for invoking the lambda from api Gateway"
  value       = aws_lambda_function.this.invoke_arn
}

output "arn" {
  description = "The ARN for identifying the lamdba"
  value       = aws_lambda_function.this.arn
}
