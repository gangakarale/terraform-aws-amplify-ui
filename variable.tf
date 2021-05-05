variable "aws_profile" {
  type        = string
  default     = "default"
  description = "Name of configured AWS profile to use"
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Region where to provision Lambda"
}

variable "service_name" {
  type        = string
  description = "Service Name"
}

variable "amplify_role" {
  type        = string
  description = "Name for the role used in amplify app"
}

variable "cloudformation_stack_name" {
  type        = string
  description = "Name of the cloud formation stack "
}

variable "amplify_repository_url" {
  type        = string
  description = "Github URL of the code repository. e.g. <https://github.com/medlypharmacy/ibd-app>"
}

variable "domain_name" {
  type        = string
  description = "Root domain in route 53. For e.g dev-medly.io"
}

variable "amplify_app_name" {
  type        = string
  description = "Name of the amplify app resource"
}
variable "amplify_subdomain" {
  type        = string
  description = "subdomain to access the frontend amplify app For e.g da if URL is da.dev-medly.io"
}

variable "env" {
  default = "Test"
}

variable "OauthToken" {
  default = "XXXXXXXXXXXX"
}