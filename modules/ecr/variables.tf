variable "aws_region" {
  description = "AWS region"
}

variable "aws_profile" {
  description = "AWS profile"
}

variable "remote_state_bucket" {}

variable "app_name" {
  type = string
  # default = "app"
}

variable "environment" {
  type = string
  # default = "env"
}

locals {
  repository_name = format("%s-%s", var.app_name, var.environment)
}
