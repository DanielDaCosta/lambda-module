variable "environment" {
  description = "Env"
}

variable "name" {
  description = "Application Name"
  type        = string
}

locals {
  name_dash = "${var.name}-${var.environment}"
}

###########
# Function
###########

variable "description" {
  description = "Description of lambda"
  default = null
}

variable "lambda_name" {
  description = "Lambda Function Name"
  type        = string
}

variable "handler" {
  description = "Handler"
  type        = string
  default     = "handler.handler"
}

variable "memory_size" {
  description = "Memory Size"
  type        = number
  default     = 128
}

variable "reserved_concurrent_executions" {
  description = "The amount of reserved concurrent executions for this Lambda Function."
  type        = number
  default     = -1
}

variable "runtime" {
  description = "Lambda Function runtime"
  type        = string
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 3
}

variable "s3_bucket" {
  description = "S3 bucket where zip code is stored."
  type        = string
}

variable "s3_key" {
  description = "Key of zip file"
  type        = string
}

variable "s3_object_version" {
  description = "Object version"
  type        = string
}

variable "dead_letter_target_arn" {
  description = "The ARN of an SNS topic or SQS queue to notify when an invocation fails."
  type        = string
  default     = null
}

variable "vpc_subnet_ids" {
  description = "Private Subnets"
  type        = list(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "Security Groups"
  type        = list(string)
  default     = null
}

######
# IAM
######

variable "role" {
  description = "Lambda Role"
  type        = string
}

########
# Layer
########

variable "layers" {
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function."
  type        = list(string)
  default     = null
}

############################################
# Lambda Permissions (for allowed triggers)
############################################

variable "allowed_triggers" {
  description = "Map of allowed triggers to create Lambda permissions"
  type        = map(any)
  default     = {}
}

############################
# Lambda Async Event Config
############################

variable "create_async_event_config" {
  description = "Controls whether async event configuration for Lambda Function/Alias should be created"
  type        = bool
  default     = false
}

variable "maximum_event_age_in_seconds" {
  description = "Maximum age of a request that Lambda sends to a function for processing in seconds. Valid values between 60 and 21600."
  type        = number
  default     = null
}

variable "maximum_retry_attempts" {
  description = "Maximum number of times to retry when the function returns an error. Valid values between 0 and 2. Defaults to 2."
  type        = number
  default     = null
}

variable "destination_on_failure" {
  description = "Amazon Resource Name (ARN) of the destination resource for failed asynchronous invocations"
  type        = string
  default     = null
}

variable "destination_on_success" {
  description = "Amazon Resource Name (ARN) of the destination resource for successful asynchronous invocations"
  type        = string
  default     = null
}
